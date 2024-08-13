import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChapterPage extends StatefulWidget {
  String chapterTitle;
  ChapterPage({
    super.key,
    required this.chapterTitle,
  });

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
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
      body: ListView(
        children: [
          MenuCard(
            title: "Урок 1",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 2",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 3",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 4",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 5",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 6",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 7",
            onPressed: () {},
          ),
          MenuCard(
            title: "Урок 8",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
