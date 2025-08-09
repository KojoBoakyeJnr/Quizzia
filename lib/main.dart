import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/views/about_me.dart';
import 'package:quizzia_splash_screen/views/categories.dart';
import 'package:quizzia_splash_screen/views/home.dart';
import 'package:quizzia_splash_screen/views/onboarding.dart';
import 'package:quizzia_splash_screen/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Categories());
  }
}
