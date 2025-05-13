import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_counter_flutter/main.dart';
import 'package:simple_counter_flutter/theme/theme_notifier.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifer = Provider.of<ThemeNotifier>(context);

    final isDark = themeNotifer.getTheme() == darkTheme;

    return IconButton(
      icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
      onPressed: () {
        themeNotifer.setTheme(isDark ? lightTheme : darkTheme);
      },
    );
  }
}
