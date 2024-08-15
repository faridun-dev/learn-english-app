import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

class WordAddPage extends StatefulWidget {
  const WordAddPage({super.key});

  @override
  State<WordAddPage> createState() => _WordAddPageState();
}

class _WordAddPageState extends State<WordAddPage> {
  TextEditingController wordController = TextEditingController();
  TextEditingController translationController = TextEditingController();
  TextEditingController lessonController = TextEditingController();
  TextEditingController exampleController = TextEditingController();
  TextEditingController audioController = TextEditingController();

  Future addWord(WordModel word) async {
    await WordsDatabase.instance.create(word);
    wordController.clear();
    translationController.clear();
    lessonController.clear();
    exampleController.clear();
    audioController.clear();
  }

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
        title: const Text(
          "Add word",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            TextFormField(
              controller: wordController,
              decoration: const InputDecoration(
                hintText: "Word",
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: translationController,
              decoration: const InputDecoration(
                hintText: "Translation",
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: lessonController,
              decoration: const InputDecoration(
                hintText: "Lesson number",
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: exampleController,
              decoration: const InputDecoration(
                hintText: "Example",
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: audioController,
              decoration: const InputDecoration(
                hintText: "Audio Path",
                fillColor: Colors.transparent,
                filled: true,
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: appBarColor,
                foregroundColor: backgroundColor,
              ),
              onPressed: () => addWord(
                WordModel(
                  word: wordController.text,
                  translation: translationController.text,
                  lessonNumber: lessonController.text,
                  example: exampleController.text,
                  counter: 0,
                  audioPath: audioController.text,
                ),
              ),
              child: const Text(
                "ADD WORD",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
