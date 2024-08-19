import 'dart:math';
import 'package:eng_game_app/components/cards/alert_card.dart';
import 'package:eng_game_app/components/cards/word_card.dart';
import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  late double _progressValue;
  late List<WordModel> words;
  bool questionMark = true;
  int currentIndex = 0;

  void nextPair() {
    setState(() {
      currentIndex++;
      questionMark = true;
    });
  }

  Future<void> getWords() async {
    final random = Random();
    final fetchedWords = await WordsDatabase.instance.readAllWords();
    List<WordModel> filteredWords =
        fetchedWords.where((word) => word.counter < 15).toList();

    setState(() {
      words = filteredWords.take(6).toList();
      words.shuffle(random); // Shuffle after filtering and limiting to 6
    });
  }

  @override
  void initState() {
    _progressValue = 0;
    getWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: actionBackColor,
          ),
        ),
        actionsIconTheme: const IconThemeData(
          color: actionBackColor,
        ),
        title: const Text(
          "Games",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                LinearProgressIndicator(
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(12),
                  backgroundColor: Colors.white,
                  color: appBarColor,
                  value: _progressValue,
                ),
                Text("${(_progressValue * 100).round()}%")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            words.length > currentIndex
                ? Expanded(
                    child: Column(
                      children: [
                        WordCard(currentIndex: currentIndex, words: words),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                questionMark = false;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: appBarColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: questionMark
                                    ? const Text(
                                        "?",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      )
                                    : Text(
                                        words[currentIndex].translation,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () async {
                                if (questionMark == true) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertCard(),
                                  );
                                } else {
                                  nextPair();
                                  setState(() {
                                    _progressValue += 0.01;
                                    words[currentIndex].counter++;
                                  });
                                  await WordsDatabase.instance.updateCounter(
                                    words[currentIndex],
                                  );
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: buttonColor,
                                minimumSize: const Size(
                                  150,
                                  50,
                                ),
                              ),
                              child: const Text(
                                "CORRECT",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (questionMark == true) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => const AlertCard(),
                                  );
                                } else {
                                  nextPair();
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: buttonColor,
                                minimumSize: const Size(
                                  150,
                                  50,
                                ),
                              ),
                              child: const Text(
                                "INCORRECT",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: Text("Over"),
                  ),
          ],
        ),
      ),
    );
  }
}
