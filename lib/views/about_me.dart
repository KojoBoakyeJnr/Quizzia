import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_button.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import 'package:quizzia_splash_screen/resources/app_formfields.dart';
import 'package:quizzia_splash_screen/resources/routes.dart';
import '../resources/app_strings.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool firstNameActive = false;
  bool lastNameActive = false;
  bool descriptionActive = false;

  @override
  void initState() {
    firstNameActive && lastNameActive && descriptionActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: false,
        title: Text(
          AppStrings.aboutMe,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.arrow_left),
        ),
      ),
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            AppStrings.enterFirstName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                          child: CustomTextInputField(
                            onHasTextChanged: (value) {
                              setState(() {
                                firstNameActive = value;
                              });
                            },
                            hintText: AppStrings.hintFirstName,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            AppStrings.enterLastName,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                          child: CustomTextInputField(
                            onHasTextChanged: (value) {
                              setState(() {
                                lastNameActive = value;
                              });
                            },
                            hintText: AppStrings.hintLastName,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            AppStrings.describeYourSelf,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                          child: CustomTextInputField(
                            onHasTextChanged: (value) {
                              setState(() {
                                descriptionActive = value;
                              });
                            },
                            maxLines: 5,
                            hintText: AppStrings.hintdescription,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CustomButton(
                    text: AppStrings.submit,
                    buttonColor:
                        (firstNameActive && lastNameActive && descriptionActive)
                            ? AppColors.primary
                            : AppColors.buttonGrey,
                    onPressed: () {
                      (firstNameActive && lastNameActive && descriptionActive)
                          ? Navigator.of(context).pushNamed(Routes.homePage)
                          : () {};
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
