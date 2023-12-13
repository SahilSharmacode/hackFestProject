import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SizedBox(
        height: getScreenHeight(context),
        child: Stack(
          children: <Widget>[
            // Graphic element
            Positioned(
              top: 200,
              right: getScreenWidth(context) * 0.15,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("lineAndSquare.png"),
              ),
            ),

            // girl image
            Positioned(
              bottom: 0,
              right: getScreenWidth(context) * 0.14,
              child: Image.asset(
                "girl.png",
                height: 800,
              ),
            ),

            // Graphic element
            Positioned(
              bottom: 0,
              left: -1,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("dottedSquare.png"),
              ),
            ),

            Positioned(
              bottom: 10,
              right: 20,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("triangle.png"),
              ),
            ),

            // top navigation part
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getScreenHeight(context) * 0.02,
                  horizontal: getScreenWidth(context) * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo section
                  Text(
                    "hourly",
                    style: GoogleFonts.pacifico(
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),

                  // Navigation barsection
                  Row(
                    children: [
                      Text(
                        "Find Work",
                        style: navBarStyle,
                      ),
                      navSpace,
                      Text(
                        "Hire a Assistant",
                        style: navBarStyle,
                      ),
                      navSpace,
                      Text(
                        "How it work",
                        style: navBarStyle,
                      ),
                    ],
                  ),

                  // button section
                  Row(
                    children: [
                      // Sign in Button
                      CustomFillButton(
                        buttonText: "Sign In",
                        fillColor: green,
                        onPressed: () {},
                        textColor: white,
                      ),

                      const SizedBox(
                        width: 20,
                      ),

                      // Sign up Button
                      CustomOutlineButton(
                        buttonText: "Sign Out",
                        fillColor: white,
                        onPressed: () {},
                        textColor: black,
                      ),

                      
                    ],
                  ),
                ],
              ),
            ),

            // welcome section
            Positioned(
              top: getScreenHeight(context) * 0.15,
              left: getScreenWidth(context) * 0.20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // welcome heading section
                  Row(
                    children: [
                      Text(
                        "Find the best ",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: black,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        "talent",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: green,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "for a hour",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: black,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
