import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WordCard extends StatelessWidget {
  List<WordModel> words;
  int currentIndex;
  WordCard({
    super.key,
    required this.currentIndex,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: wordCardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            words[currentIndex].word,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}
