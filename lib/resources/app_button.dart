import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double buttonBorderRadius;
  final double buttonPaddingTopBottom;
  final double buttonPaddingLeftRight;

  const CustomButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
    this.buttonBorderRadius = 10,
    this.buttonPaddingTopBottom = 17,
    this.buttonPaddingLeftRight = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
          ),
          elevation: 0,
          padding: EdgeInsets.only(
            left: buttonPaddingLeftRight,
            right: buttonPaddingLeftRight,
            top: buttonPaddingTopBottom,
            bottom: buttonPaddingTopBottom,
          ),
        ),

        child: Text(
          text,
          style: TextStyle(
            color: AppColors.primaryWhite,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
