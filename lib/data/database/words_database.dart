import 'package:eng_game_app/data/models/word_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WordsDatabase {
  static final WordsDatabase instance = WordsDatabase._init();

  Database? _database;

  WordsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("words.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const numberType = "INTEGER NOT NULL";

    await db.execute("""
      CREATE TABLE $tableWords (
        ${WordFields.id} $idType,
        ${WordFields.word} $textType,
        ${WordFields.translation} $textType,
        ${WordFields.lessonNumber} $textType,
        ${WordFields.example} $textType,
        ${WordFields.counter} $numberType,
        ${WordFields.audioPath} $textType
      )
    """);
  }

  Future<WordModel> create(WordModel word) async {
    final db = await instance.database;

    final id = await db.insert(tableWords, word.toJson());

    return word.copy(id: id);
  }

  Future<WordModel> readWord(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWords,
      columns: WordFields.values,
      where: "${WordFields.id} = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return WordModel.fromJson(maps.first);
    } else {
      throw Exception("ID $id is not found!");
    }
  }

  Future<List<WordModel>> readAllWords() async {
    final db = await instance.database;

    final result = await db.query(tableWords);

    return result.map((json) => WordModel.fromJson(json)).toList();
  }

  Future<List<WordModel>?> readLesson(String lesson) async {
    final db = await instance.database;

    final result = await db.query(
      tableWords,
      columns: WordFields.values,
      where: "${WordFields.lessonNumber} = ?",
      whereArgs: [lesson],
    );

    if (result.isEmpty) {
      throw Exception("No Lesson $lesson words found in DB");
    } else {
      return result.map((json) => WordModel.fromJson(json)).toList();
    }
  }

  Future<int> updateWord(WordModel word) async {
    final db = await instance.database;

    return await db.update(
      tableWords,
      word.toJson(),
      where: "${WordFields.id} = ?",
      whereArgs: [word.id],
    );
  }

  Future<int> deleteWord(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableWords,
      where: "${WordFields.id} = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
