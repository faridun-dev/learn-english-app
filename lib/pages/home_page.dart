import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<WordModel> words = [];

  Future refreshWords() async {
    final fetchWords = await WordsDatabase.instance.readAllWords();
    setState(() {
      words = fetchWords;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshWords();
  }

  @override
  void dispose() {
    WordsDatabase.instance.close();
    super.dispose();
  }

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
      //     Navigator.of(context)
      //         .pushNamed(
      //       "/addWord",
      //     )
      //         .then((_) {
      //       refreshWords();
      //     });
      //   },
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
      body: ListView(),
    );
  }
}
