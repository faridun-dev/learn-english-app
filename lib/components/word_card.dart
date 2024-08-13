import 'package:eng_game_app/components/constants.dart';
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
        decoration: BoxDecoration(
          color: menuCardColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
          boxShadow: [
            BoxShadow(
              color: menuCardShadow,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              word,
              style: const TextStyle(
                color: fontColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Divider(),
            Text(
              translation,
              style: const TextStyle(
                color: fontColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
