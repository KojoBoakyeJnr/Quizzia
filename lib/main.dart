import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/about_me.dart';
import 'package:quizzia_splash_screen/onboarding.dart';
import 'package:quizzia_splash_screen/splash_screen.dart';
import 'package:quizzia_splash_screen/views/categories.dart';
import 'package:quizzia_splash_screen/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AboutMe());
  }
}
