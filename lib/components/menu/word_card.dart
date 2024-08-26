import 'package:eng_game_app/components/styles.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class WordCard extends StatelessWidget {
  WordModel word;
  WordCard({
    super.key,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        // final player = AudioPlayer();
        // player.play(AssetSource("path/to/audio/"));
      },
      child: Padding(
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
                word.word,
                style: wordTextStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                word.translation,
                style: translationTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
