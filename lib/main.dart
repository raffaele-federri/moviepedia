import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/sections/home_section/screen/home_screen.dart';
import 'package:movies_app/sections/main_section/screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffold,
      ),
      home: const MainScreen(),
    );
  }
}
