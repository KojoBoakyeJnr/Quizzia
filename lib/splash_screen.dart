import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/quizzia_logo.svg"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Quizzia App",
                        style: GoogleFonts.originalSurfer(),
                      ),
                    ),
                  ],
                ),
              ),

              Text("Developed by Samuel Boakye"),
            ],
          ),
        ),
      ),
    );
  }
}
