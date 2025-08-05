import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            //first child ---appbar
            AppBar(
              centerTitle: false,
              title: Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              leading: Icon(CupertinoIcons.arrow_left),
            ),

            //second child ---input fields
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                  child: Column(
                    children: [
                      MyInputField(
                        headerText: "Enter your first name",
                        placeholderText: "First Name",
                        controllerName: firstNameController,
                      ),
                      MyInputField(
                        headerText: "Enter your last name",
                        placeholderText: "Last Name",
                        controllerName: lastNameController,
                      ),
                      MyInputField(
                        headerText: "Describe yourself",
                        placeholderText:
                            "Briefly describe yourself and your interests",
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
                          if (Colors.amber[800] != null) {
                            return Colors.amber[800]!;
                          } else {
                            return Colors.amber;
                          }
                        } else {
                          return Colors.grey;
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
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
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
            cursorColor: Colors.amber[800],
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(231, 230, 230, 1),
              hintText: placeholderText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
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
