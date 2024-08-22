import 'package:eng_game_app/components/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WordCard extends StatelessWidget {
  String word;
  String translation;
  WordCard({
    super.key,
    required this.word,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 10,
        right: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(
          30,
        ),
        decoration: wordCardBoxDecoration,
        child: Column(
          children: [
            Text(
              word,
              style: wordTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              translation,
              style: translationTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
