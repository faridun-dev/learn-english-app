import 'package:eng_game_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _checked = false;

  ThemeData get themeData => _themeData;

  bool get checked => _checked;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  set checked(bool checked) {
    _checked = checked;
    notifyListeners();
  }

  void toggleTheme() async {
    if (_themeData == lightMode) {
      themeData = darkMode;
      checked = true;
    } else {
      themeData = lightMode;
      checked = false;
    }
    _saveToPrefs();
  }

  void _loadThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = prefs.getBool("isDarkMode") ?? false;

    if (isDarkMode) {
      _themeData = darkMode;
      _checked = true;
    } else {
      _themeData = lightMode;
      _checked = false;
    }
    notifyListeners();
  }

  void _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _checked);
  }
}
