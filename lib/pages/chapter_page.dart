import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/lesson_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterPage extends StatefulWidget {
  String chapterTitle;
  final data;
  ChapterPage({
    super.key,
    required this.chapterTitle,
    required this.data,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    List lessons = widget.data.keys.toList();
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
          return LessonCard(
            title: lessons[index],
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/lesson",
                arguments: {
                  "lessonTitle": lessons[index],
                  "data": widget.data[lessons[index]],
                },
              );
            },
          );
        },
      ),
    );
  }
}
