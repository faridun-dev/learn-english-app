import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      child: GestureDetector(
        onTap: () {
          //! We need real audio to use! We have just added test data.
          // final player = AudioPlayer();
          // player.play(AssetSource("path/to/audio/"));
          SystemSound.play(SystemSoundType.click);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              words[currentIndex].word,
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
