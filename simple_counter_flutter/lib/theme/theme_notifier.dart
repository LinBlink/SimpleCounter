import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_counter_flutter/main.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightBlue,
  dividerColor: Colors.transparent,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blueGrey,
  dividerColor: Colors.transparent,
);

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
