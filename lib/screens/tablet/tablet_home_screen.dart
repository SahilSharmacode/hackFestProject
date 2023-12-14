import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/main.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';
import 'package:my_web_app/widgets/pointText.dart';

import '../../widgets/custom_fill_button.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

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
                    "Find Work",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hire a Assistant",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "How it work",
                    style: navBarStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              CustomFillButton(
                        buttonText: "Sign In",
                        fillColor: green,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),),);
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),),);
                },
                textColor: black,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: white,
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "hourly",
          style: GoogleFonts.pacifico(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
      ),
      backgroundColor: white,
      body: SizedBox(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        child: Stack(
          children: <Widget>[
            getScreenWidth(context) < 966
                ? Positioned(
                    right: -350,
                    top: 5,
                    child: Image.asset(
                      "circleGreenDot.png",
                      height: 700,
                    ),
                  )
                : const SizedBox(),

            // girl image
            getScreenWidth(context) < 966
                ? const SizedBox()
                : Positioned(
                    bottom: 0,
                    right: getScreenWidth(context) * 0.05,
                    child: Image.asset(
                      "girl.png",
                      height: 700,
                    ),
                  ),

            // Graphic element
            Positioned(
              bottom: -60,
              left: -15,
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

            // welcome section
            Positioned(
              bottom: getScreenWidth(context) < 966
                  ? getScreenHeight(context) * 0.20
                  : getScreenHeight(context) * 0.30,
              left: getScreenWidth(context) * 0.15,
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
                          fontSize: 45,
                        ),
                      ),
                      Text(
                        "talent",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: green,
                          fontSize: 45,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "for a hour",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: black,
                      fontSize: 45,
                    ),
                  ),

                  // bullet points
                  getScreenWidth(context) < 966
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BulletPointTextWidget(
                                  fontSize: 20,
                                  textColor: Colors.grey,
                                  text:
                                      "World's largest freelance marketplace"),
                              BulletPointTextWidget(
                                  fontSize: 20,
                                  textColor: Colors.grey,
                                  text: "Any job you can possibly think of"),
                              BulletPointTextWidget(
                                  fontSize: 20,
                                  textColor: Colors.grey,
                                  text: "Save up to 90% & get quotes for free"),
                              BulletPointTextWidget(
                                  fontSize: 20,
                                  textColor: Colors.grey,
                                  text: "Pay only when you're 100% happy"),
                            ],
                          ),
                        )
                      : const SizedBox(),

                  // button navigation section
                  Padding(
                    padding: EdgeInsets.only(
                      top: getScreenWidth(context) < 966
                          ? 100
                          : getScreenHeight(context) * 0.03,
                    ),
                    child: Row(
                      children: [
                        
                        CustomFillButton(
                          buttonText: "Find Talent",
                          fillColor: green,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                          },
                          textColor: white,
                        ),
                      ],
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
