import 'package:eng_game_app/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _checked = false;

  ThemeData get themeData => _themeData;

  bool get checked => _checked;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  set checked(bool checked) {
    _checked = checked;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      checked = true;
    } else {
      themeData = lightMode;
      checked = false;
    }
  }
}
