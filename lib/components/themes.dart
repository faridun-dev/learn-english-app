import 'package:eng_game_app/components/constants.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: "Sans Pro 3",
  appBarTheme: const AppBarTheme(
    backgroundColor: appBarColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: appBarFontColor,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  ),
);
