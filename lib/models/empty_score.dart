import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/app_strings.dart';

class EmptyScores extends StatelessWidget {
  const EmptyScores({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        dashPattern: [8, 8],
        color: AppColors.dottedBorderGrey,

        child: Container(
          width: 358,
          height: 220,
          child: Center(
            child: Container(
              width: 246,
              height: 122,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment, size: 40, color: AppColors.textGrey),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textGrey),
                      AppStrings.noScoreRecorded,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
