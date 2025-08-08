import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources.dart/app_colors.dart';
import 'package:quizzia_splash_screen/resources.dart/app_images.dart';
import '../resources.dart/app_strings.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  AppImages.onboardingPatternDesign,
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      // style: TextStyle()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                      AppStrings.onboardingTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      AppStrings.onboardingSubtitle,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 358,
                  height: 58,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.primary,
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 18,
                          bottom: 18,
                        ),
                      ),
                    ),
                    child: Text(
                      AppStrings.getStarted,
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 30, left: 30),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.byClickingGetStarted,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.termsOfService,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.and,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: AppStrings.privacyPolicies,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
