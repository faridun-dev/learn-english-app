import 'package:eng_game_app/components/menu/lesson_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReferencePage extends StatefulWidget {
  String chapter;
  List<int> lessons;
  ReferencePage({
    super.key,
    required this.chapter,
    required this.lessons,
  });

  @override
  State<ReferencePage> createState() => _ReferencePageState();
}

class _ReferencePageState extends State<ReferencePage> {
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
          "Reference for ${widget.chapter}",
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
                "/referenceLesson",
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
