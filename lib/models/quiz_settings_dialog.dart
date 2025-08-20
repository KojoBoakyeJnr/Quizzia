import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzia_splash_screen/resources/app_button.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/app_strings.dart';
import 'package:quizzia_splash_screen/resources/quiz_difficulty_provider.dart';
import 'package:quizzia_splash_screen/views/display_difficulty.dart';

class QuizSettingsDialog extends StatefulWidget {
  const QuizSettingsDialog({super.key});

  @override
  State<QuizSettingsDialog> createState() => _QuizSettingsDialogState();
}

class _QuizSettingsDialogState extends State<QuizSettingsDialog> {
  int _questionSize = 0;

  @override
  void initState() {
    super.initState();
    _questionSize = 5;
  }

  void increaseQuestion() {
    if (_questionSize < 20) {
      setState(() {
        _questionSize++;
      });
    }
  }

  void decreaseQuestion() {
    if (_questionSize > 0) {
      setState(() {
        _questionSize--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizDifficultyProvider>(
      builder:
          (context, difficultyProvider, child) => (AlertDialog(
            backgroundColor: AppColors.primaryWhite,
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              height: 402,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      left: 16,
                      right: 16,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.quizSettings,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            CupertinoIcons.clear_circled,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.howManyQuestions,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuantityButton(
                                icon: Icons.remove,
                                onTap: decreaseQuestion,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.dottedBorderGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                width: 102,
                                height: 56,
                                child: Center(
                                  child: Text(
                                    "$_questionSize",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                              QuantityButton(
                                icon: Icons.add,
                                onTap: increaseQuestion,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            AppStrings.selectDifficulty,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        DifficultyDropDown(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 24.0,
                      top: 32.0,
                    ),
                    child: CustomButton(
                      text: AppStrings.startQuiz,
                      buttonColor: AppColors.primary,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayDifficulty(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class QuantityButton extends StatelessWidget {
  IconData icon;
  VoidCallback onTap;
  QuantityButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 102,
      height: 56,
      child: MaterialButton(
        onPressed: onTap,
        child: Icon(icon, color: AppColors.primary),
      ),
    );
  }
}

class DifficultyDropDown extends StatefulWidget {
  DifficultyDropDown({super.key});

  @override
  State<DifficultyDropDown> createState() => _DifficultyDropDownState();
}

class _DifficultyDropDownState extends State<DifficultyDropDown> {
  List<String> difficultyLevels = [
    AppStrings.easy,
    AppStrings.medium,
    AppStrings.hard,
  ];

  String _selectedValue = AppStrings.easy;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizDifficultyProvider>(
      builder:
          (context, quizDifficultyProvider, child) => (SizedBox(
            width: double.infinity,
            child: DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.dottedBorderGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.only(top: 21, bottom: 21, left: 10),
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              elevation: 0,
              borderRadius: BorderRadius.circular(10),
              dropdownColor: AppColors.dottedBorderGrey,

              value: _selectedValue,
              icon: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.expand_more,
                  size: 30,
                  color: AppColors.black,
                ),
              ),
              items: [
                for (int i = 0; i < difficultyLevels.length; i++)
                  DropdownMenuItem<Object>(
                    value: difficultyLevels[i],
                    child: Text(
                      difficultyLevels[i],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
              onChanged: (value) {
                _selectedValue = value.toString();
                quizDifficultyProvider.setDifficulty(_selectedValue);
              },
            ),
          )),
    );
  }
}
