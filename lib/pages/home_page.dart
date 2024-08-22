import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu/menu_card.dart';
import 'package:eng_game_app/data/database/words_database.dart';
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

  final List<List<Map<String, dynamic>>> lessons = [
    // Lesson 1
    [
      {
        "word": "hello",
        "translation": "привет",
        "lessonNumber": "1",
        "example": "Hello, Mrs. Smith",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/hello.mp3",
      },
      {
        "word": "bye",
        "translation": "пока",
        "lessonNumber": "1",
        "example": "Bye, my friend!",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/bye.mp3",
      },
      {
        "word": "mine",
        "translation": "мой, моя, моё",
        "lessonNumber": "1",
        "example": "That car is mine",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/mine.mp3",
      },
      {
        "word": "car",
        "translation": "машина",
        "lessonNumber": "1",
        "example": "Car's color is red",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/car.mp3",
      },
      {
        "word": "color",
        "translation": "цвет",
        "lessonNumber": "1",
        "example": "This color is awesome",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/color.mp3",
      },
      {
        "word": "he",
        "translation": "он",
        "lessonNumber": "1",
        "example": "He is my friend",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/he.mp3",
      },
    ],
    // Lesson 2
    [
      {
        "word": "she",
        "translation": "она",
        "lessonNumber": "2",
        "example": "She is very kind",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/she.mp3",
      },
      {
        "word": "friend",
        "translation": "друг",
        "lessonNumber": "2",
        "example": "My friend is here",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/friend.mp3",
      },
      {
        "word": "book",
        "translation": "книга",
        "lessonNumber": "2",
        "example": "I like reading this book",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/book.mp3",
      },
      {
        "word": "pen",
        "translation": "ручка",
        "lessonNumber": "2",
        "example": "Please give me a pen",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/pen.mp3",
      },
      {
        "word": "sun",
        "translation": "солнце",
        "lessonNumber": "2",
        "example": "The sun is shining brightly",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/sun.mp3",
      },
      {
        "word": "water",
        "translation": "вода",
        "lessonNumber": "2",
        "example": "Water is essential for life",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/water.mp3",
      },
    ],
    // Lesson 3
    [
      {
        "word": "cat",
        "translation": "кот",
        "lessonNumber": "3",
        "example": "The cat is on the roof",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/cat.mp3",
      },
      {
        "word": "dog",
        "translation": "собака",
        "lessonNumber": "3",
        "example": "The dog is barking",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/dog.mp3",
      },
      {
        "word": "city",
        "translation": "город",
        "lessonNumber": "3",
        "example": "This city is huge",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/city.mp3",
      },
      {
        "word": "food",
        "translation": "еда",
        "lessonNumber": "3",
        "example": "This food tastes great",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/food.mp3",
      },
      {
        "word": "table",
        "translation": "стол",
        "lessonNumber": "3",
        "example": "The table is made of wood",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/table.mp3",
      },
      {
        "word": "chair",
        "translation": "стул",
        "lessonNumber": "3",
        "example": "I need a chair to sit on",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/chair.mp3",
      },
    ],
    // Lesson 4
    [
      {
        "word": "computer",
        "translation": "компьютер",
        "lessonNumber": "4",
        "example": "This computer is fast",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/computer.mp3",
      },
      {
        "word": "window",
        "translation": "окно",
        "lessonNumber": "4",
        "example": "The window is open",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/window.mp3",
      },
      {
        "word": "phone",
        "translation": "телефон",
        "lessonNumber": "4",
        "example": "My phone is ringing",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/phone.mp3",
      },
      {
        "word": "river",
        "translation": "река",
        "lessonNumber": "4",
        "example": "The river is flowing fast",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/river.mp3",
      },
      {
        "word": "mountain",
        "translation": "гора",
        "lessonNumber": "4",
        "example": "We climbed the mountain",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/mountain.mp3",
      },
      {
        "word": "forest",
        "translation": "лес",
        "lessonNumber": "4",
        "example": "The forest is dense",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/forest.mp3",
      },
    ],
    // Lesson 5
    [
      {
        "word": "bread",
        "translation": "хлеб",
        "lessonNumber": "5",
        "example": "I bought some bread",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/bread.mp3",
      },
      {
        "word": "milk",
        "translation": "молоко",
        "lessonNumber": "5",
        "example": "I need milk for my coffee",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/milk.mp3",
      },
      {
        "word": "market",
        "translation": "рынок",
        "lessonNumber": "5",
        "example": "Let's go to the market",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/market.mp3",
      },
      {
        "word": "school",
        "translation": "школа",
        "lessonNumber": "5",
        "example": "I attend school every day",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/school.mp3",
      },
      {
        "word": "teacher",
        "translation": "учитель",
        "lessonNumber": "5",
        "example": "The teacher is explaining",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/teacher.mp3",
      },
      {
        "word": "student",
        "translation": "ученик",
        "lessonNumber": "5",
        "example": "I am a student",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/student.mp3",
      },
    ],
    // Lesson 6
    [
      {
        "word": "music",
        "translation": "музыка",
        "lessonNumber": "6",
        "example": "I love listening to music",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/music.mp3",
      },
      {
        "word": "movie",
        "translation": "фильм",
        "lessonNumber": "6",
        "example": "Let's watch a movie tonight",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/movie.mp3",
      },
      {
        "word": "art",
        "translation": "искусство",
        "lessonNumber": "6",
        "example": "Art is subjective",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/art.mp3",
      },
      {
        "word": "museum",
        "translation": "музей",
        "lessonNumber": "6",
        "example": "We visited a museum yesterday",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/museum.mp3",
      },
      {
        "word": "painting",
        "translation": "картина",
        "lessonNumber": "6",
        "example": "This painting is beautiful",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/painting.mp3",
      },
      {
        "word": "song",
        "translation": "песня",
        "lessonNumber": "6",
        "example": "I like this song",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/song.mp3",
      },
    ],
    // Lesson 7
    [
      {
        "word": "science",
        "translation": "наука",
        "lessonNumber": "7",
        "example": "Science helps us understand the world",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/science.mp3",
      },
      {
        "word": "experiment",
        "translation": "эксперимент",
        "lessonNumber": "7",
        "example": "The experiment was successful",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/experiment.mp3",
      },
      {
        "word": "engineer",
        "translation": "инженер",
        "lessonNumber": "7",
        "example": "He works as an engineer",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/engineer.mp3",
      },
      {
        "word": "technology",
        "translation": "технология",
        "lessonNumber": "7",
        "example": "Technology evolves quickly",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/technology.mp3",
      },
      {
        "word": "computer",
        "translation": "компьютер",
        "lessonNumber": "7",
        "example": "My computer is fast",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/computer.mp3",
      },
      {
        "word": "math",
        "translation": "математика",
        "lessonNumber": "7",
        "example": "Math is my favorite subject",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/math.mp3",
      },
    ],
    // Lesson 8
    [
      {
        "word": "ocean",
        "translation": "океан",
        "lessonNumber": "8",
        "example": "The ocean is vast",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/ocean.mp3",
      },
      {
        "word": "desert",
        "translation": "пустыня",
        "lessonNumber": "8",
        "example": "The desert is dry",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/desert.mp3",
      },
      {
        "word": "island",
        "translation": "остров",
        "lessonNumber": "8",
        "example": "The island is remote",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/island.mp3",
      },
      {
        "word": "valley",
        "translation": "долина",
        "lessonNumber": "8",
        "example": "We hiked through the valley",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/valley.mp3",
      },
      {
        "word": "glacier",
        "translation": "ледник",
        "lessonNumber": "8",
        "example": "The glacier is melting",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/glacier.mp3",
      },
      {
        "word": "mountain",
        "translation": "гора",
        "lessonNumber": "8",
        "example": "We climbed the mountain",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/mountain.mp3",
      },
    ],
    // Lesson 9
    [
      {
        "word": "galaxy",
        "translation": "галактика",
        "lessonNumber": "9",
        "example": "The galaxy contains billions of stars",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/galaxy.mp3",
      },
      {
        "word": "planet",
        "translation": "планета",
        "lessonNumber": "9",
        "example": "Earth is our planet",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/planet.mp3",
      },
      {
        "word": "universe",
        "translation": "вселенная",
        "lessonNumber": "9",
        "example": "The universe is expanding",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/universe.mp3",
      },
      {
        "word": "star",
        "translation": "звезда",
        "lessonNumber": "9",
        "example": "That star is bright",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/star.mp3",
      },
      {
        "word": "meteor",
        "translation": "метеор",
        "lessonNumber": "9",
        "example": "We saw a meteor",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/meteor.mp3",
      },
      {
        "word": "comet",
        "translation": "комета",
        "lessonNumber": "9",
        "example": "The comet passed by Earth",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/comet.mp3",
      },
    ],
    // Lesson 10
    [
      {
        "word": "biology",
        "translation": "биология",
        "lessonNumber": "10",
        "example": "Biology is the study of life",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/biology.mp3",
      },
      {
        "word": "chemistry",
        "translation": "химия",
        "lessonNumber": "10",
        "example": "Chemistry is fascinating",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/chemistry.mp3",
      },
      {
        "word": "physics",
        "translation": "физика",
        "lessonNumber": "10",
        "example": "Physics explains the laws of the universe",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/physics.mp3",
      },
      {
        "word": "genetics",
        "translation": "генетика",
        "lessonNumber": "10",
        "example": "Genetics determines traits",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/genetics.mp3",
      },
      {
        "word": "evolution",
        "translation": "эволюция",
        "lessonNumber": "10",
        "example": "Evolution takes millions of years",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/evolution.mp3",
      },
      {
        "word": "ecosystem",
        "translation": "экосистема",
        "lessonNumber": "10",
        "example": "The ecosystem is diverse",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/ecosystem.mp3",
      },
    ],
    // Lesson 11
    [
      {
        "word": "economy",
        "translation": "экономика",
        "lessonNumber": "11",
        "example": "The economy is growing",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/economy.mp3",
      },
      {
        "word": "finance",
        "translation": "финансы",
        "lessonNumber": "11",
        "example": "Finance is important",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/finance.mp3",
      },
      {
        "word": "market",
        "translation": "рынок",
        "lessonNumber": "11",
        "example": "The market fluctuates",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/market.mp3",
      },
      {
        "word": "currency",
        "translation": "валюта",
        "lessonNumber": "11",
        "example": "The currency is stable",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/currency.mp3",
      },
      {
        "word": "investment",
        "translation": "инвестиция",
        "lessonNumber": "11",
        "example": "Investment in stocks",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/investment.mp3",
      },
      {
        "word": "trade",
        "translation": "торговля",
        "lessonNumber": "11",
        "example": "Global trade is crucial",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/trade.mp3",
      },
    ],
    // Lesson 12
    [
      {
        "word": "law",
        "translation": "закон",
        "lessonNumber": "12",
        "example": "Law keeps society in order",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/law.mp3",
      },
      {
        "word": "court",
        "translation": "суд",
        "lessonNumber": "12",
        "example": "The court reached a verdict",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/court.mp3",
      },
      {
        "word": "justice",
        "translation": "справедливость",
        "lessonNumber": "12",
        "example": "Justice was served",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/justice.mp3",
      },
      {
        "word": "crime",
        "translation": "преступление",
        "lessonNumber": "12",
        "example": "Crime rates are low",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/crime.mp3",
      },
      {
        "word": "police",
        "translation": "полиция",
        "lessonNumber": "12",
        "example": "The police maintain order",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/police.mp3",
      },
      {
        "word": "judge",
        "translation": "судья",
        "lessonNumber": "12",
        "example": "The judge made a fair decision",
        "counter": 0,
        "audioPath": "/home/faridun-dev/Desktop/judge.mp3",
      },
    ]
  ];

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
          example: wordPair["example"], // Add examples if needed
          counter: wordPair["counter"],
          audioPath: wordPair["audioPath"], // Add audio paths if needed
          font: "Sans Pro 3",
        );
        await wordsDb.create(word);
      }
    }
  }

  @override
  void initState() {
    _insertInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isLocked(1);
    _isLocked(13);
    final List<Map<String, dynamic>> chapters = [
      {
        "title": "Chapter 1",
        "lessons": List.generate(12, (index) => index + 1), // [1, 2, ..., 12]
        "locked": false,
      },
      {
        "title": "Chapter 2",
        "lessons":
            List.generate(12, (index) => index + 13), // [13, 14, ..., 24]
        "locked": chapterTwo,
      },
      {
        "title": "Chapter 3",
        "lessons":
            List.generate(12, (index) => index + 25), // [25, 26, ..., 36]
        "locked": chapterThree,
      },
      {
        "title": "Games",
        "locked": false,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Изучение английского языка",
          style: TextStyle(
            color: appBarFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return chapter["title"] == "Games"
              ? MenuCard(
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
                );
        },
      ),
    );
  }
}
