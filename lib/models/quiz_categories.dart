import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';

class QuizCategory extends StatelessWidget {
  String categoryName;
  SvgPicture categoryIcon;
  QuizCategory(this.categoryName, this.categoryIcon);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.secondary,
      ),

      width: 174,
      height: 167,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoryIcon,
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              categoryName,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
