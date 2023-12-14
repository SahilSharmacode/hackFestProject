import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/main.dart';
import 'package:my_web_app/screens/add_portal_screen.dart';
import 'package:my_web_app/screens/application_screen.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/my_portal_screen.dart';
import 'package:my_web_app/screens/requirement_ask_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';

class MyWorkScreen extends StatefulWidget {
  const MyWorkScreen({super.key});

  @override
  State<MyWorkScreen> createState() => _MyWorkScreenState();
}

class _MyWorkScreenState extends State<MyWorkScreen> {
  FirebaseFirestore database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: white,
        child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Text(
                      "Explore",
                      style: navBarStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPortalScreen(),
                          ));
                    },
                    child: Text(
                      "My portals",
                      style: navBarStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My work",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Work Submition",
                    style: GoogleFonts.poppins(
                      color: Colors.blue.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              CustomFillButton(
                buttonText: "Add Portal",
                fillColor: green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPortalScreen(),
                    ),
                  );
                },
                textColor: white,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomOutlineButton(
                buttonText: "Sign Out",
                fillColor: white,
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ));
                },
                textColor: black,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: white,
        title: Text(
          "My Work",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Container(),
      ),
    );
  }
}
