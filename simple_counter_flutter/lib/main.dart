import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simple_counter_flutter/screens/counter_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_counter_flutter/screens/settings_screen/settings_screen.dart';
import 'package:simple_counter_flutter/theme/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final isDark = prefs.getBool('isDark') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(isDark ? darkTheme : lightTheme, prefs),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '列表计数器',
      theme: themeNotifier.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => CounterScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
