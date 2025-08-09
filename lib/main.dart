// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/routes.dart';
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
    return MaterialApp(
      routes: {
        Routes.splashScreenPage: (context) => const SplashScreen(),
        Routes.onboardingPage: (context) => const Onboarding(),
        Routes.aboutMePage: (context) => const AboutMe(),
        Routes.homePage: (context) => const Home(),
        Routes.categoriesPage: (context) => const Categories(),
      },
    );
  }
}
