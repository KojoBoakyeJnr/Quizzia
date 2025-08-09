import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/models/empty_score.dart';
import 'package:quizzia_splash_screen/models/score.dart';
import 'package:quizzia_splash_screen/views/home.dart';

class ScoreSection extends StatefulWidget {
  const ScoreSection({super.key});

  @override
  State<ScoreSection> createState() => _ScoreSectionState();
}

class _ScoreSectionState extends State<ScoreSection> {
  @override
  Widget build(BuildContext context) {
    List<Score> scoreHistory = [];
    if (scoreHistory.isEmpty) {
      return EmptyScores();
    } else {
      return EmptyScores(); //---this will be replaced when the user has scores
    }
  }
}
