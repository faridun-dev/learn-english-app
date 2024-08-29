import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundProvider extends ChangeNotifier {
  bool _soundOn = true;

  bool get soundOn => _soundOn;

  SoundProvider() {
    _loadFromPrefs();
  }

  set soundOn(bool soundOn) {
    _soundOn = soundOn;
    notifyListeners();
  }

  void toggleSound() {
    if (soundOn) {
      soundOn = false;
    } else {
      soundOn = true;
    }
    _saveToPrefs();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isOn = prefs.getBool("soundOn")!;

    if (isOn) {
      _soundOn = true;
    } else {
      _soundOn = false;
    }
    notifyListeners();
  }

  void _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("soundOn", _soundOn);
  }
}
