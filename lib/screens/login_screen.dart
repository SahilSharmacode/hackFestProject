import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 50,),
                Text("Welcome back!", style: GoogleFonts.poppins(color: black, fontWeight: FontWeight.bold, fontSize: 40),),
                Text("Please enter you details", style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),),



                TextField(
                  controller: emailController,
                  cursorColor: green,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: green, width: 2)
                    ),
                    hintText: "Enter your email"
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
