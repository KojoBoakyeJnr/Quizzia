import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/app_images.dart';
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

class ProfileRow extends StatelessWidget {
  ProfileRow({super.key});
  String userName =
      AppStrings
          .sampleUserName; //i will use firstNameController from about_me page

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
                child: SizedBox(
                  width: 296,
                  height: 52,
                  child: SearchBar(
                    elevation: WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.inputFieldGrey,
                    ),
                    hintText: AppStrings.search,
                    hintStyle: WidgetStatePropertyAll(
                      TextStyle(color: AppColors.textGrey, fontSize: 14),
                    ),
                    leading: Icon(
                      size: 13.53,
                      CupertinoIcons.search,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
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
              SectionHeader(AppStrings.categories, AppStrings.seeMore),
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
                    SectionHeader(AppStrings.scoreHistory, AppStrings.viewMore),
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

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AppImages.sampleProfilePhoto,
          fit: BoxFit.cover,
        ),
      ),
      width: 42,
      height: 42,
    );
  }
}

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

class SectionHeader extends StatelessWidget {
  String header;
  String secondaryAction;
  SectionHeader(this.header, this.secondaryAction);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          header,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        Text(
          secondaryAction,
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

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

class Score {
  final String category;
  final int value;
  final DateTime date;

  Score({required this.category, required this.value, required this.date});
}

class ScoreSection extends StatefulWidget {
  ScoreSection({super.key});

  @override
  State<ScoreSection> createState() => _ScoreSectionState();
}

class _ScoreSectionState extends State<ScoreSection> {
  List<Score> scoreHistory = [];
  @override
  Widget build(BuildContext context) {
    if (scoreHistory.isEmpty) {
      return EmptyScores();
    } else {
      return EmptyScores(); //---this will be replaced when the user has scores
    }
  }
}
