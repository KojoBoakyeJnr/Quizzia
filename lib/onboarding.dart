import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset("assets/pattern.svg"),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      // style: GoogleFonts.raleway()),
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                      "Quizzia helps you challenge and assess your knowledge in any field of study",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      "We’ve got various categories of quizzes, including mathematics, science, anime, books, music and so much more. Let’s get started now",
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
                    onPressed: () {
                      print("clicked");
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.fromMap({
                        WidgetState.error: Colors.red,
                        WidgetState.hovered: Colors.amber[400],
                        WidgetState.focused: Colors.amber[800],
                        ~WidgetState.disabled: Colors.amber[800],
                      }),
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
                      "Get Started",
                      style: GoogleFonts.raleway(
                        color: Colors.white,
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
                          text: "By clicking Get Started, you agree to our ",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: "Terms Of Service",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policies",
                          style: GoogleFonts.raleway(
                            color: Colors.black,
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
