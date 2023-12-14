import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/main.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';
import 'package:my_web_app/widgets/pointText.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: white,
          title: Text(
            "hourly",
            style: GoogleFonts.pacifico(
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          centerTitle: true,
        ),
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
                  buttonText: "Sign Up",
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
        backgroundColor: white,
        body: Container(
          child: Center(
            child: Stack(
              
              children: [
                    
                    
                    
                    
                // the welcome section
                Padding(
                 padding:
                EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // welcome test for the landing

                      Text(
                        "Find the best talent for an hour",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: black,
                          fontSize: 50 ,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BulletPointTextWidget(
                          fontSize:getScreenWidth(context) < 500? 17 : getScreenWidth(context) < 400? 15: 20,
                          textColor: Colors.grey,
                          text: "World's largest freelance marketplace"),
                      BulletPointTextWidget(
                        fontSize:getScreenWidth(context) < 500? 17 : getScreenWidth(context) < 400? 15: 20,
                        textColor: Colors.grey,
                        text: "Any job you can possibly think of",
                      ),
                      BulletPointTextWidget(
                        fontSize:getScreenWidth(context) < 500? 17 : getScreenWidth(context) < 400? 15: 20,
                        textColor: Colors.grey,
                        text: "Save up to 90% & get quotes for free",
                      ),
                      BulletPointTextWidget(
                        fontSize:getScreenWidth(context) < 500? 17 : getScreenWidth(context) < 400? 15: 20,
                        textColor: Colors.grey,
                        text: "Pay only when you're 100% happy",
                      ),
                          
                      const SizedBox(
                        height: 50,
                      ),
                          
                      

                          
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                        },
                        child: Container(
                          width: getScreenWidth(context),
                          height:  60,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(color: black, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Center(
                              child: Text(
                                "Find Talent",
                                style: GoogleFonts.poppins(
                                  color: black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
