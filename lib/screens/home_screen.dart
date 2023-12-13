import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: white,
                    fontWeight: FontWeight.w500,
                    fontSize: 100
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
