import 'package:eng_game_app/components/constants.dart';
import 'package:eng_game_app/components/menu/reference_word_card.dart';
import 'package:eng_game_app/data/database/words_database.dart';
import 'package:eng_game_app/data/models/word_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReferenceLessonPage extends StatefulWidget {
  String lessonNumber;
  ReferenceLessonPage({
    super.key,
    required this.lessonNumber,
  });

  @override
  State<ReferenceLessonPage> createState() => _ReferenceLessonPageState();
}

class _ReferenceLessonPageState extends State<ReferenceLessonPage> {
  late List<WordModel> words = [];

  Future getWords() async {
    final fetchedWords =
        await WordsDatabase.instance.readLesson(widget.lessonNumber);
    setState(() {
      words = fetchedWords!;
    });
  }

  @override
  void initState() {
    super.initState();
    getWords();
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
        title: Text(
          "Lesson ${widget.lessonNumber}",
        ),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          return ReferenceWordCard(word: words[index]);
        },
      ),
    );
  }
}
