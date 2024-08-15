import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/word_card.dart';
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
    words = await WordsDatabase.instance.readAllWords();
    setState(() {});
  }

  @override
  void initState() {
    refreshWords();
    super.initState();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBarColor,
        foregroundColor: backgroundColor,
        onPressed: () => Navigator.of(context).pushNamed(
          "/addWord",
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return WordCard(
            word: words[index].word,
            translation: words[index].translation,
          );
        },
        itemCount: words.length,
      ),
    );
  }
}
