import 'package:eng_game_app/pages/chapter_page.dart';
import 'package:eng_game_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color backgroundColor = Color(0xFFE6E6E6);
const Color menuCardColor = Color(0xFFFFFFFF);
const Color fontColor = Color(0xFF651D32);
const Color appBarColor = Color(0xFF205493);
const Color appBarFontColor = Color(0xFFFFFFFF);
const Color actionBackColor = Color(0xFFFFFFFF);
Color menuCardShadow = const Color(0xFF808080).withOpacity(0.5);

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/chapter": (context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return ChapterPage(
      chapterTitle: args["chapterTitle"]!,
    );
  },
};
