import 'package:eng_game_app/components/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
