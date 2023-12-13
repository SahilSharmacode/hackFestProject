import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/main.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  bool hide = true;
  var eye = Icon(Icons.emergency_sharp);

  bool hideConfirm = true;
  var confirmEye = Icon(Icons.emergency_sharp);

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
                  "Welcome first time!",
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
                  height: 30,
                ),
                // confirm password text input field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm password",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                    TextField(
                      obscureText: hideConfirm,
                      controller: confirmPasswordController,
                      cursorColor: green,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (hideConfirm) {
                                  hideConfirm = false;
                                  confirmEye =
                                      Icon(Icons.remove_red_eye_rounded);
                                } else {
                                  hideConfirm = true;
                                  confirmEye = Icon(Icons.emergency_sharp);
                                }
                              });
                            },
                            icon: confirmEye),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                        hintText: "confirm password",
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                // Sign in button
                GestureDetector(
                  onTap: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      errorMessage("Password should be same", context);
                    } else {
                      try {
                        await auth.createUserWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: confirmPasswordController.text.trim(),
                        );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),));
                      } on FirebaseAuthException catch (e) {
                        String? error = e.message;
                        errorMessage(error!, context);
                      }
                    }
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
                        child: Text(
                          "Sign Up",
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
                      "Have an account?  ",
                      style: GoogleFonts.poppins(
                        color: black.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
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
