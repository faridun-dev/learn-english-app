const String tableWords = "words";

class WordFields {
  static final List<String> values = [
    id,
    word,
    translation,
    lessonNumber,
    example,
    counter,
  ];

  static const id = "_id";
  static const word = "word";
  static const translation = "translation";
  static const lessonNumber = "lessonNumber";
  static const example = "example";
  static const counter = "counter";
}

class WordModel {
  final int? id;
  final String word;
  final String translation;
  final String lessonNumber;
  final String example;
  final int counter;

  const WordModel({
    this.id,
    required this.word,
    required this.translation,
    required this.lessonNumber,
    required this.example,
    required this.counter,
  });

  Map<String, Object?> toJson() => {
        WordFields.id: id,
        WordFields.word: word,
        WordFields.translation: translation,
        WordFields.lessonNumber: lessonNumber,
        WordFields.example: example,
        WordFields.counter: counter,
      };

  WordModel copy({
    int? id,
    String? word,
    String? translation,
    String? lessonNumber,
    String? example,
    int? counter,
  }) =>
      WordModel(
        word: word ?? this.word,
        translation: translation ?? this.translation,
        lessonNumber: lessonNumber ?? this.lessonNumber,
        example: example ?? this.example,
        counter: counter ?? this.counter,
      );

  static WordModel fromJson(Map<String, Object?> json) => WordModel(
        id: json[WordFields.id] as int?,
        word: json[WordFields.word] as String,
        translation: json[WordFields.translation] as String,
        lessonNumber: json[WordFields.lessonNumber] as String,
        example: json[WordFields.example] as String,
        counter: json[WordFields.counter] as int,
      );
}
