import 'package:flutter/foundation.dart';
import 'package:quizzia_splash_screen/resources/app_strings.dart';

class QuizDifficultyProvider extends ChangeNotifier {
  // your state
  String difficulty = AppStrings.easy;

  // your actions
  void setDifficulty(String value) {
    difficulty = value;
    notifyListeners();
  }
}
