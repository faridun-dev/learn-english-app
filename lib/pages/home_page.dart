import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: ListView(
        children: [
          MenuCard(
            title: "Chapter 1",
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/chapter",
                arguments: {"chapterTitle": "Chapter 1", "lessons": 12},
              );
            },
            lock: false,
          ),
        ],
      ),
    );
  }
}
