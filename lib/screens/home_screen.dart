import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/screens/add_portal_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Text(
                    "Explore",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My portals",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My work",
                    style: navBarStyle,
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
          "hourly",
          style: GoogleFonts.pacifico(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            // navigation bar
            Row(
              children: [
                // Logo
                Text(
                  "Logo",
                  style: GoogleFonts.montserrat(
                      color: white, fontWeight: FontWeight.w500, fontSize: 100),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
