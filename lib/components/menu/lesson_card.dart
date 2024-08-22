import 'package:eng_game_app/components/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LessonCard extends StatelessWidget {
  String title;
  void Function()? onPressed;
  LessonCard({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            22,
          ),
          decoration: lessonCardBoxDecoration,
          child: Center(
            child: Text(
              title,
              style: lessonCardTextStyle
            ),
          ),
        ),
      ),
    );
  }
}
