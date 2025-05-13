import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_counter_flutter/main.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;
  final SharedPreferences prefs;

  ThemeNotifier(this._themeData, this.prefs);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    await prefs.setBool('isDark', themeData == darkTheme);
    notifyListeners();
  }
}
