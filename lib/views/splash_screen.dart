import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/routes.dart';
import '../resources/app_strings.dart';
import '../resources/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.of(context).pushNamed(Routes.onboardingPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppImages.appLogo,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppStrings.appName,
                        style: GoogleFonts.originalSurfer(
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                AppStrings.developedBy,
                style: TextStyle(color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
