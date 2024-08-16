import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> chapters = [
    {
      "title": "Chapter 1",
      "lessons": List.generate(12, (index) => index + 1), // [1, 2, ..., 12]
      "locked": false,
    },
    {
      "title": "Chapter 2",
      "lessons": List.generate(12, (index) => index + 13), // [13, 14, ..., 24]
      "locked": true,
    },
    {
      "title": "Chapter 3",
      "lessons": List.generate(12, (index) => index + 25), // [25, 26, ..., 36]
      "locked": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Изучение английского языка",
            style: TextStyle(
              color: appBarFontColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: appBarColor,
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: appBarColor,
        //   foregroundColor: backgroundColor,
        //   onPressed: () {
        //     Navigator.of(context).pushNamed(
        //       "/addWord",
        //     );
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
        body: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              final chapter = chapters[index];
              return MenuCard(
                title: chapter["title"],
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "/chapter",
                    arguments: {
                      "chapterTitle": chapter["title"],
                      "lessons": chapter["lessons"],
                    },
                  );
                },
                lock: chapter["locked"],
              );
            }));
  }
}
