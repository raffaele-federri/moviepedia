import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/sections/main_section/screen/main_screen.dart';

final rootKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final chuck = Chuck(
  navigatorKey: rootKey,
  showNotification: false,
  showInspectorOnShake: false,
  darkTheme: true,
);

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: rootKey,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.scaffold,
      ),
      home: const MainScreen(),
    );
  }
}
