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
  late List<WordModel> words = [];
  bool questionMark = true;
  int currentIndex = 0;

  @override
  void initState() {
    _progressValue = 0;
    _initializeGame();
    super.initState();
  }

  Future<void> _initializeGame() async {
    final random = Random();
    final fetchedWords = await WordsDatabase.instance.readAllWords();
    List<WordModel> filteredWords =
        fetchedWords.where((word) => word.counter < 15).toList();
    filteredWords.shuffle(random);

    setState(() {
      words = filteredWords.take(6).toList();
      words.shuffle(random);
    });
  }

  void _handleCorrectAnswer() async {
    if (!questionMark) {
      _progressValue += 0.01;
      words[currentIndex].counter++;
      await WordsDatabase.instance.updateCounter(words[currentIndex]);
      _nextPair();
    } else {
      _showAlert();
    }
  }

  void _handleIncorrectAnswer() {
    if (!questionMark) {
      _nextPair();
    } else {
      _showAlert();
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
      context: context,
      builder: (context) => const AlertCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon:
              const Icon(Icons.arrow_back_ios_rounded, color: actionBackColor),
        ),
        title: const Text("Games"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildProgressIndicator(),
            const SizedBox(height: 10),
            words.length > currentIndex
                ? _buildGameContent()
                : const Center(child: Text("Over")),
          ],
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
          backgroundColor: Colors.white,
          color: appBarColor,
          value: _progressValue,
        ),
        Text("${(_progressValue * 100).round()}%")
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
          color: appBarColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            questionMark ? "?" : words[currentIndex].translation,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
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
        backgroundColor: buttonColor,
        minimumSize: const Size(150, 50),
      ),
      child: Text(label, style: TextStyle(color: color)),
    );
  }
}
