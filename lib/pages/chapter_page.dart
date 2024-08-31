import 'package:eng_game_app/components/menu/lesson_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterPage extends StatefulWidget {
  String chapterTitle;
  List<int> lessons;
  ChapterPage({
    super.key,
    required this.chapterTitle,
    required this.lessons,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
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
          widget.chapterTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.lessons.length,
        itemBuilder: (context, index) {
          return LessonCard(
            title: "Lesson ${widget.lessons[index]}",
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/lesson",
                arguments: {
                  "lessonNumber": "${widget.lessons[index]}",
                },
              );
            },
          );
        },
      ),
    );
  }
}
