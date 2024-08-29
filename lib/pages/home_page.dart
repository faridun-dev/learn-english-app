import 'package:eng_game_app/components/menu/game_card.dart';
import 'package:eng_game_app/components/menu/menu_card.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/initial_date.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool chapterTwo = false;
  bool chapterThree = false;
  Future _isLocked(int lesson) async {
    final db = WordsDatabase.instance;

    List<WordModel> data = await db.readAllWords();
    List<WordModel> chapterData = [];
    final lessons = List.generate(12, (index) => lesson + index);

    for (var element in lessons) {
      for (WordModel word in data) {
        if (word.lessonNumber == "$element") {
          chapterData.add(word);
        }
      }
    }

    if (chapterData.every((word) => word.counter < 20)) {
      if (lesson == 1) {
        setState(() {
          chapterTwo = true;
        });
      } else if (lesson == 13) {
        setState(() {
          chapterThree = true;
        });
      }
    } else {
      return false;
    }
  }

  List<int> learnedChapter = [0, 0, 0];
  List<bool> lockedChapter = [false, false, false];

  Future<void> _insertInitialData() async {
    final wordsDb = WordsDatabase.instance;

    final List<WordModel> existingWords = await wordsDb.readAllWords();
    if (existingWords.isNotEmpty) return;

    for (int lessonIndex = 0; lessonIndex < lessons.length; lessonIndex++) {
      for (final wordPair in lessons[lessonIndex]) {
        final WordModel word = WordModel(
          word: wordPair['word']!,
          translation: wordPair['translation']!,
          lessonNumber: wordPair["lessonNumber"],
          example: wordPair["example"],
          counter: wordPair["counter"],
          audioPath: wordPair["audioPath"],
          font: "Sans Pro 3",
          chapterNumber: wordPair["chapterNumber"],
        );
        await wordsDb.create(word);
      }
    }
  }

  Future chapterCheck(String chapterNumber) async {
    final data = await WordsDatabase.instance.readChapter(chapterNumber);

    for (var word in data) {
      if (word.counter > 20) {
        setState(() {
          learnedChapter[int.parse(chapterNumber) - 1]++;
        });
      }
    }
  }

  @override
  void initState() {
    _insertInitialData();
    chapterCheck("1");
    chapterCheck("2");
    chapterCheck("3");
    _isLocked(1);
    _isLocked(13);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chapters = [
      {
        "title": "Chapter 1",
        "lessons": List.generate(12, (index) => index + 1), // [1, 2, ..., 12]
        "locked": false,
        "learned": learnedChapter[0],
      },
      {
        "title": "Chapter 2",
        "lessons":
            List.generate(12, (index) => index + 13), // [13, 14, ..., 24]
        "locked": chapterTwo,
        "learned": learnedChapter[1],
      },
      {
        "title": "Chapter 3",
        "lessons":
            List.generate(12, (index) => index + 25), // [25, 26, ..., 36]
        "locked": chapterThree,
        "learned": learnedChapter[2],
      },
      {
        "title": "Games",
        "locked": false,
      },
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: const Icon(
          Icons.settings,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/settings");
        },
      ),
      appBar: AppBar(
        title: Text(
          "Изучение английского языка",
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder( 
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return chapter["title"] == "Games"
              ? GameCard(
                  title: chapter["title"],
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "/games",
                    );
                  },
                  lock: chapter["locked"],
                )
              : MenuCard(
                  title: chapter["title"],
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "/chapter",
                      arguments: {
                        "chapterTitle": chapter["title"],
                        "lessons": chapter["lessons"]
                      },
                    );
                  },
                  lock: chapter["locked"],
                  learned: chapter["learned"],
                );
        },
      ),
    );
  }
}
