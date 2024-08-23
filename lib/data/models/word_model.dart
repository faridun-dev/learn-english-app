const String tableWords = "tableWords";

class WordFields {
  static final List<String> values = [
    id,
    word,
    translation,
    lessonNumber,
    example,
    counter,
    audioPath,
    font,
    chapterNumber,
  ];

  static const id = "_id";
  static const word = "word";
  static const translation = "translation";
  static const lessonNumber = "lessonNumber";
  static const example = "example";
  static const counter = "counter";
  static const audioPath = "audioPath";
  static const font = "font";
  static const chapterNumber = "chapterNumber";
}

class WordModel {
  final int? id;
  final String word;
  final String translation;
  final String lessonNumber;
  final String example;
  int counter;
  final String audioPath;
  final String font;
  final String chapterNumber;

  WordModel({
    this.id,
    required this.word,
    required this.translation,
    required this.lessonNumber,
    required this.example,
    required this.counter,
    required this.audioPath,
    required this.font,
    required this.chapterNumber,
  });

  Map<String, Object?> toJson() => {
        WordFields.id: id,
        WordFields.word: word,
        WordFields.translation: translation,
        WordFields.lessonNumber: lessonNumber,
        WordFields.example: example,
        WordFields.counter: counter,
        WordFields.audioPath: audioPath,
        WordFields.font: font,
        WordFields.chapterNumber: chapterNumber,
      };

  WordModel copy({
    int? id,
    String? word,
    String? translation,
    String? lessonNumber,
    String? example,
    int? counter,
    String? audioPath,
    String? font,
    String? chapterNumber,
  }) =>
      WordModel(
        id: id ?? this.id,
        word: word ?? this.word,
        translation: translation ?? this.translation,
        lessonNumber: lessonNumber ?? this.lessonNumber,
        example: example ?? this.example,
        counter: counter ?? this.counter,
        audioPath: audioPath ?? this.audioPath,
        font: font ?? this.font,
        chapterNumber: chapterNumber ?? this.chapterNumber,
      );

  static WordModel fromJson(Map<String, Object?> json) => WordModel(
        id: json[WordFields.id] as int?,
        word: json[WordFields.word] as String,
        translation: json[WordFields.translation] as String,
        lessonNumber: json[WordFields.lessonNumber] as String,
        example: json[WordFields.example] as String,
        counter: json[WordFields.counter] as int,
        audioPath: json[WordFields.audioPath] as String,
        font: json[WordFields.font] as String,
        chapterNumber: json[WordFields.chapterNumber] as String,
      );
}
