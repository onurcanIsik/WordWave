import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wordwave/color/colors.dart';
import 'package:wordwave/components/utils/splash_screen.dart';
import 'package:wordwave/service/provider/dark_mode.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('score_box');
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<DarkThemeProvider>(context).isDarkMode;
    return MaterialApp(
      theme: isDarkMode ? _buildDarkTheme() : _buildLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.teal,
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: bgColor,
    );
  }
}
