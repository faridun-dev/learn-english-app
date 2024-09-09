import 'dart:async';
import 'dart:math';
import 'package:eng_game_app/components/cards/alert_card.dart';
import 'package:eng_game_app/components/cards/word_card.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:eng_game_app/theme/theme.dart';
import 'package:eng_game_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  int lives = 3;
  List<Widget> livesIcons = List.generate(
    3,
    (_) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
        size: 35,
      );
    },
  );
  bool questionMark = true;
  int currentIndex = 0;
  late double _progressValue;
  late List<WordModel> words = [];
  late List<WordModel> matchGameWords = [];
  List<WordModel?> firstColumnWords = [];
  List<WordModel?> secondColumnWords = [];
  WordModel? selectedFirstWord;
  WordModel? selectedSecondWord;
  bool isWrong = false;

  int seconds = 10;
  Timer? _timer;

  @override
  void initState() {
    _progressValue = 0;
    _initializeGame();
    super.initState();
  }

  void startTimer() {
    bool isRunning = _timer == null ? false : _timer!.isActive;

    if (isRunning) {
      stopTimer();
    }

    setState(() {
      seconds = 10;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timeOut();
      }
    });
  }

  void timeOut() {
    setState(() {
      lives--;
      livesIcons.removeLast();
    });
    _livesCheck();
    if (lives > 0) {
      _nextPair();
      startTimer();
    }
  }

  void stopTimer() {
    _timer!.cancel();
  }

  Future<void> _initializeGame() async {
    final random = Random();
    final fetchedWords = await WordsDatabase.instance.readAllWords();
    List<WordModel> filteredWords =
        fetchedWords.where((word) => word.counter < 20).toList();
    filteredWords.shuffle(random);

    setState(() {
      words = filteredWords.take(6).toList();
      matchGameWords = words.toList();
      firstColumnWords = List.from(matchGameWords);
      secondColumnWords = List.from(matchGameWords)..shuffle(random);
    });
    startTimer();
  }

  void _handleCorrectAnswer() async {
    if (!questionMark) {
      _progressValue += 0.01;
      words[currentIndex].counter++;
      await WordsDatabase.instance.updateCounter(words[currentIndex]);
      _nextPair();
      startTimer();
    } else {
      _showAlert();
    }
  }

  void _handleIncorrectAnswer() {
    if (!questionMark) {
      setState(() {
        lives--;
        livesIcons.removeLast();
      });
      if (lives > 0) {
        startTimer();
        _nextPair();
      }
      _livesCheck();
    } else {
      _showAlert();
    }
  }

  void _livesCheck() {
    if (lives < 1) {
      stopTimer();
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor:
                  Provider.of<ThemeProvider>(context).themeData == lightMode
                      ? Theme.of(context).scaffoldBackgroundColor
                      : Colors.grey,
              title: Text(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                "Game is over. All lives are wasted",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Go back to main",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  void _nextPair() {
    setState(() {
      currentIndex++;
      questionMark = true;
    });
  }

  void _showAlert() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const AlertCard(),
    );
  }

  void _gameOver() {
    stopTimer();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor:
                Provider.of<ThemeProvider>(context).themeData == lightMode
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Colors.grey,
            title: Text(
              "Game is over",
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            content: Text(
              "Congratulations! You've matched all the words!",
              style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _handleWordSelection(WordModel word, bool isFirstColumn) {
    setState(() {
      if (isFirstColumn) {
        selectedFirstWord = word;
      } else {
        selectedSecondWord = word;
      }

      if (selectedFirstWord != null && selectedSecondWord != null) {
        _checkForMatch();
      }
    });
  }

  void _checkForMatch() async {
    if (selectedFirstWord!.translation == selectedSecondWord!.translation) {
      setState(() {
        selectedFirstWord!.counter++;
      });
      await WordsDatabase.instance.updateCounter(selectedFirstWord!);

      await Future.delayed(const Duration(
        milliseconds: 600,
      )); // Wait for 1 second

      // Update the state after the delay
      setState(() {
        int firstIndex = firstColumnWords.indexOf(selectedFirstWord);
        int secondIndex = secondColumnWords.indexOf(selectedSecondWord);

        firstColumnWords[firstIndex] = null;
        secondColumnWords[secondIndex] = null;

        _progressValue += 0.1; // Increment progress
        selectedFirstWord = null;
        selectedSecondWord = null;
      });

      // Check if the game is over
      if (firstColumnWords.every((word) => word == null) &&
          secondColumnWords.every((word) => word == null)) {
        _gameOver();
      }
    } else {
      setState(() {
        isWrong = true;
      });

      await Future.delayed(const Duration(milliseconds: 400));

      setState(() {
        isWrong = false;
        selectedFirstWord = null;
        selectedSecondWord = null;
        lives--;
        livesIcons.removeLast();
      });

      if (lives > 0) {
        startTimer();
      }

      _livesCheck();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        title: Text(
          "Games",
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildLivesIndicator(),
            _buildProgressIndicator(),
            const SizedBox(height: 10),
            words.length > currentIndex
                ? _buildGameContent()
                : _buildMatchGame()
          ],
        ),
      ),
    );
  }

  Widget _buildLivesIndicator() {
    return livesIcons.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: livesIcons.map((live) => live).toList(),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Lives are wasted",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        LinearProgressIndicator(
          minHeight: 10,
          borderRadius: BorderRadius.circular(12),
          backgroundColor: Theme.of(context).colorScheme.surface,
          color: Theme.of(context).colorScheme.primary,
          value: _progressValue,
        ),
        Text("${(_progressValue * 100).round()}%"),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 1.0,
            end: seconds / 10,
          ),
          duration: const Duration(milliseconds: 1000),
          builder: (context, value, child) {
            return LinearProgressIndicator(
              minHeight: 10,
              backgroundColor: Theme.of(context).colorScheme.surface,
              color: Theme.of(context).colorScheme.primary,
              value: value,
            );
          },
        )
      ],
    );
  }

  Widget _buildGameContent() {
    return Expanded(
      child: Column(
        children: [
          WordCard(currentIndex: currentIndex, words: words),
          const SizedBox(height: 10),
          Expanded(child: _buildTranslationContainer()),
          const SizedBox(height: 10),
          _buildAnswerButtons(),
        ],
      ),
    );
  }

  Widget _buildTranslationContainer() {
    return GestureDetector(
      onTap: () {
        setState(() {
          questionMark = false;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            questionMark ? "TAP" : words[currentIndex].translation,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAnswerButton("CORRECT", Colors.green, _handleCorrectAnswer),
        _buildAnswerButton("INCORRECT", Colors.red, _handleIncorrectAnswer),
      ],
    );
  }

  Widget _buildAnswerButton(String label, Color color, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        minimumSize: const Size(150, 50),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildMatchGame() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: firstColumnWords.map((word) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: word != null
                          ? () => _handleWordSelection(word, true)
                          : null,
                      child: word != null
                          ? Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: selectedFirstWord == word
                                    ? (isWrong ? Colors.red : Colors.green)
                                    : Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  word.word,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: secondColumnWords.map((word) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: word != null
                          ? () => _handleWordSelection(word, false)
                          : null,
                      child: word != null
                          ? Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: selectedSecondWord == word
                                    ? (isWrong ? Colors.red : Colors.green)
                                    : Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  word.translation,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
