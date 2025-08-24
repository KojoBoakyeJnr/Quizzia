// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia_splash_screen/providers/quiz_difficulty_provider.dart';
import 'package:quizzia_splash_screen/resources/routes.dart';
import 'package:quizzia_splash_screen/views/about_me.dart';
import 'package:quizzia_splash_screen/views/categories.dart';
import 'package:quizzia_splash_screen/views/home.dart';
import 'package:quizzia_splash_screen/views/onboarding.dart';
import 'package:quizzia_splash_screen/views/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuizDifficultyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.splashScreenPage: (context) => SplashScreen(),
        Routes.onboardingPage: (context) => Onboarding(),
        Routes.aboutMePage: (context) => AboutMe(),
        Routes.homePage: (context) => Home(),
        Routes.categoriesPage: (context) => Categories(),
      },
    );
  }
}
