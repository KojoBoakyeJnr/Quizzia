import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quizzia_splash_screen/models/profile_picture.dart';
import 'package:quizzia_splash_screen/models/quiz_categories.dart';
import 'package:quizzia_splash_screen/models/score_section.dart';
import 'package:quizzia_splash_screen/models/section_header.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/app_formfields.dart';
import 'package:quizzia_splash_screen/resources/app_images.dart';
import 'package:quizzia_splash_screen/resources/routes.dart';
import '../resources/app_strings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Column(
          children: [
            ProfileRow(),
            Expanded(child: SingleChildScrollView(child: ScrollableRow())),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatefulWidget {
  const ProfileRow({super.key});

  @override
  State<ProfileRow> createState() => _ProfileRowState();
}

class _ProfileRowState extends State<ProfileRow> {
  String userName = AppStrings.sampleUserName;
  //i will use firstNameController from about_me page
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: const EdgeInsets.all(10.0), child: ProfilePicture()),
        Padding(
          padding: const EdgeInsets.only(top: 21.5, bottom: 21.5),
          child: Text(
            "${AppStrings.hi}, $userName",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class ScrollableRow extends StatefulWidget {
  const ScrollableRow({super.key});

  @override
  State<ScrollableRow> createState() => _ScrollableRowState();
}

class _ScrollableRowState extends State<ScrollableRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SearchInputField(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.inputFieldGrey,
                ),
                width: 52,
                height: 52,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.slider_horizontal_3),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 25.5, left: 16, right: 16),
          child: Column(
            children: [
              SectionHeader(AppStrings.categories, AppStrings.seeMore, () {
                Navigator.of(context).pushNamed(Routes.categoriesPage);
              }),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 374,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,

                    mainAxisSpacing: 16,
                    children: [
                      QuizCategory(
                        AppStrings.mathematics,
                        AppImages.mathematicsLogo,
                      ),
                      QuizCategory(AppStrings.sports, AppImages.sportsLogo),
                      QuizCategory(AppStrings.history, AppImages.historyLogo),
                      QuizCategory(AppStrings.animals, AppImages.animalsLogo),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34.0),
                child: Column(
                  children: [
                    SectionHeader(
                      AppStrings.scoreHistory,
                      AppStrings.viewMore,
                      () {},
                    ),
                    ScoreSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
