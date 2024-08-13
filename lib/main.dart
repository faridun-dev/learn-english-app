import 'package:eng_game_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Sans Pro 3"
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
