import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/word_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LessonPage extends StatefulWidget {
  String lessonTitle;
  final data;
  LessonPage({
    super.key,
    required this.lessonTitle,
    required this.data,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    List words = widget.data.keys.toList();

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
        title: Text(
          widget.lessonTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return WordCard(
            word: words[index],
            translation: widget.data[words[index]]![0].toString(),
          );
        },
      ),
    );
  }
}
