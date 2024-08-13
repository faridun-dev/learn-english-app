import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu_card.dart';
import 'package:eng_game_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _box = Hive.box("database");
  @override
  void initState() {
    if (!_box.containsKey("data")) {
      _box.put("data", data);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = _box.get("data");
    List chapters = database.keys.toList();
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
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return MenuCard(
            title: chapters[index],
            lock: false,
            onPressed: () {
              Navigator.of(context).pushNamed(
                "/chapter",
                arguments: {
                  "chapterTitle": chapters[index],
                  "data": database[chapters[index]],
                },
              );
            },
          );
        },
      ),
    );
  }
}
