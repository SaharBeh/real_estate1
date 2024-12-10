import 'package:flutter/material.dart';
import 'screens/LandingPage.dart';
import 'utils/constants.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design 1',
      theme: ThemeData(
        scaffoldBackgroundColor: COLOR_WHITE,
          primaryColor: COLOR_WHITE,
          textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
          fontFamily: "Montserrat",
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: COLOR_WHITE)),
      home: const LandingPage(),
    );
  }
}
