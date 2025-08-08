import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources.dart/app_colors.dart';
import 'package:quizzia_splash_screen/views/home.dart';
import 'package:quizzia_splash_screen/resources.dart/app_images.dart';
import '../resources.dart/app_strings.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: false,
        title: Text(
          AppStrings.quizCategories,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        leading: Icon(CupertinoIcons.arrow_left),
      ),
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0, left: 13, right: 13),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                QuizCategory(AppStrings.mathematics, AppImages.mathematicsLogo),
                QuizCategory(AppStrings.sports, AppImages.sportsLogo),
                QuizCategory(AppStrings.history, AppImages.historyLogo),
                QuizCategory(AppStrings.animals, AppImages.animalsLogo),
                QuizCategory(AppStrings.anime, AppImages.animeLogo),
                QuizCategory(AppStrings.vehicles, AppImages.vehiclesLogo),
                QuizCategory(AppStrings.film, AppImages.filmLogo),
                QuizCategory(AppStrings.videoGames, AppImages.videoGamesLogo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
