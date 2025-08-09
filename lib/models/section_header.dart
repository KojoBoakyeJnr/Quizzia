import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_colors.dart';

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
