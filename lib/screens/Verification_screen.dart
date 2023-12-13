import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class VerificationScreen extends StatefulWidget {
 
  VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController emailController = TextEditingController();

  bool isEmailVerified = false;

  Timer? timer;
  

  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;


    if(!isEmailVerified){
      sendEmailVerif();

      timer = Timer.periodic(Duration(seconds: 10), (timer) {
        checkEmailVerification();
      });
    }
    
  }

  

  Future sendEmailVerif() async {

    try{
          final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    sucessMessage("Verification message is send sucessfully", context);
    } on FirebaseAuthException catch (e){
      String? error = e.message;
      errorMessage(error!, context);
    }


  }

  Future checkEmailVerification () async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified? HomePage() : Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          width: getScreenWidth(context) * 0.40,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Email is sent to verify",
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
              ),

              SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
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
                          "Resend",
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
