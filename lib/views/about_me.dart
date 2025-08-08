import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';
import '../resources/app_strings.dart';

class AboutMe extends StatefulWidget {
  AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final descriptionController = TextEditingController();

  bool isFormFilled = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(() {
      checkIfFormIsFIlled(
        firstNameController,
        lastNameController,
        descriptionController,
      );
    });
    lastNameController.addListener(() {
      checkIfFormIsFIlled(
        firstNameController,
        lastNameController,
        descriptionController,
      );
    });
    descriptionController.addListener(() {
      checkIfFormIsFIlled(
        firstNameController,
        lastNameController,
        descriptionController,
      );
    });
  }

  void checkIfFormIsFIlled(
    TextEditingController a,
    TextEditingController b,
    TextEditingController c,
  ) {
    if (a.text.isEmpty || b.text.isEmpty || c.text.isEmpty) {
      setState(() {
        isFormFilled = false;
      });
    } else {
      setState(() {
        isFormFilled = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: false,
        title: Text(
          AppStrings.aboutMe,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        leading: Icon(CupertinoIcons.arrow_left),
      ),
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Column(
          children: [
            //first child ---input fields
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                  child: Column(
                    children: [
                      MyInputField(
                        headerText: AppStrings.enterFirstName,
                        placeholderText: AppStrings.hintFirstName,
                        controllerName: firstNameController,
                      ),
                      MyInputField(
                        headerText: AppStrings.enterLastName,
                        placeholderText: AppStrings.hintLastName,
                        controllerName: lastNameController,
                      ),
                      MyInputField(
                        headerText: AppStrings.describeYourSelf,
                        placeholderText: AppStrings.hintdescription,
                        controllerName: descriptionController,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //third child ---button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: 358,
                  height: 58,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((states) {
                        if (isFormFilled) {
                          if (AppColors.primary != null) {
                            return AppColors.primary;
                          } else {
                            return AppColors.primary;
                          }
                        } else {
                          return AppColors.buttonGrey;
                        }
                      }),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppStrings.submit,
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  @override
  String headerText;
  String placeholderText;
  TextEditingController controllerName;
  int maxLines;
  MyInputField({
    required this.headerText,
    required this.placeholderText,
    required this.controllerName,
    this.maxLines = 1,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              headerText,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          TextField(
            maxLines: maxLines,

            controller: controllerName,
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 18, bottom: 18),
              filled: true,
              fillColor: AppColors.inputFieldGrey,
              hintText: placeholderText,
              hintStyle: TextStyle(color: AppColors.textGrey, fontSize: 14.0),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
