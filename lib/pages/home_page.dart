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
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          MenuCard(
            title: "Часть 1",
          ),
          MenuCard(
            title: "Часть 2",
          ),
          MenuCard(
            title: "Часть 3",
          ),
          MenuCard(
            title: "Игры",
          ),
        ],
      ),
    );
  }
}
