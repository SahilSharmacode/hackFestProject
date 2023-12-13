import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_web_app/screens/forget_password_screen.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;

  bool hide = true;
  var eye = Icon(Icons.emergency_sharp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) < 500
              ? 10
              : getScreenWidth(context) < 1000
                  ? getScreenWidth(context) * 0.25
                  : getScreenWidth(context) * 0.35,
          vertical: 40,
        ),
        child: Container(
          width: getScreenWidth(context),
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              children: [
                Text(
                  "hourly",
                  style: GoogleFonts.pacifico(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome back!",
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "Please enter you details",
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
                ),

                const SizedBox(
                  height: 50,
                ),

                // email text input field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    TextField(
                      controller: emailController,
                      cursorColor: green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                        hintText: "example@domain.com",
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                // password text input field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    TextField(
                      obscureText: hide,
                      controller: passwordController,
                      cursorColor: green,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (hide) {
                                  hide = false;
                                  eye = Icon(Icons.remove_red_eye_rounded);
                                } else {
                                  hide = true;
                                  eye = Icon(Icons.emergency_sharp);
                                }
                              });
                            },
                            icon: eye),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                        hintText: "password",
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 5,
                ),
                // forget password section
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Forget Password",
                        style: GoogleFonts.poppins(
                            color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // Sign in button
                GestureDetector(
                  onTap: () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });

                      await auth.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      String? error = e.message;
                      print(error);
                      errorMessage(error!, context);
                    }

                    print("Login is successfull");
                  },
                  child: Container(
                    width: getScreenWidth(context),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Center(
                        child: isLoading
                            ? loding()
                            : Text(
                                "Sign in",
                                style: GoogleFonts.poppins(
                                  color: white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                // Sign up redirection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?  ",
                      style: GoogleFonts.poppins(
                        color: black.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          color: black.withOpacity(0.9),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
