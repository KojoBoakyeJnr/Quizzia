import 'package:flutter/material.dart';
import 'package:quizzia_splash_screen/resources/app_images.dart';

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
