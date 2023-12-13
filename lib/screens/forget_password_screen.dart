import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          width: getScreenWidth(context) * 0.40,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email passwrod reset link will send to your email",
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 30,),
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
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () async {
                    try{

                    await auth.sendPasswordResetEmail(email: emailController.text.trim());
                    sucessMessage("Email is send to you email", context);
                    } on FirebaseAuthException catch (e){
                      String? error = e.message;
                      errorMessage(error!, context);
                    }
                  },
                  child: Container(
                    width: getScreenWidth(context) * 0.3,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Center(
                        child: Text(
                          "Send email",
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
            ],
          ),
        ),
      ),
    );
  }
}
