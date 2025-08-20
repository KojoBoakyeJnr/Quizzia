import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia_splash_screen/resources/quiz_difficulty_provider.dart';

class DisplayDifficulty extends StatelessWidget {
  const DisplayDifficulty({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizDifficultyProvider>(
      builder:
          (context, quizDifficultyProvider, child) => Scaffold(
            appBar: AppBar(title: Text(quizDifficultyProvider.difficulty)),
          ),
    );
  }
}
