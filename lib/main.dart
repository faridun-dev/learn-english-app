import 'package:eng_game_app/components/route.dart';
import 'package:eng_game_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
    );
  }
}
