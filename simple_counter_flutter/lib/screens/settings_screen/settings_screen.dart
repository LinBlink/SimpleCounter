import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_counter_flutter/main.dart';
import 'package:simple_counter_flutter/theme/theme_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("设置")),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('暗黑模式'),
            value: themeNotifier.getTheme() == darkTheme,
            onChanged: (value) {
              themeNotifier.setTheme(value ? darkTheme : lightTheme);
            },
          ),
        ],
      ),
    );
  }
}
