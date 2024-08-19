import 'package:eng_game_app/pages/chapter_page.dart';
import 'package:eng_game_app/pages/games_page.dart';
import 'package:eng_game_app/pages/home_page.dart';
import 'package:eng_game_app/pages/lesson_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/chapter": (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return ChapterPage(
      chapterTitle: args["chapterTitle"]!,
      lessons: args["lessons"],
    );
  },
  "/lesson": (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return LessonPage(
    lessonNumber: args["lessonNumber"],
    );
  },
  "/games": (context) => const GamesPage(),
};
