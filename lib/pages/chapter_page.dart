import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/lesson_card.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterPage extends StatefulWidget {
  String chapterTitle;
  List<WordModel> data;
  ChapterPage({
    super.key,
    required this.chapterTitle,
    required this.data,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  List<WordModel> lessons = [];
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
        title: Text(
          widget.chapterTitle,
        ),
      ),
      body: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return LessonCard(title: (index + 1).toString(), onPressed: () {});
          }),
    );
  }
}
