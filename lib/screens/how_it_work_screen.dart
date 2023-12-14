import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/themes.dart';

class HowItWorkScreen extends StatelessWidget {
  const HowItWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        automaticallyImplyLeading: false,
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
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About our app",
                style: GoogleFonts.montserrat(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Our app will give you apportunity to hirea a assistent for an hour or you can also work her and can earn extra money on your free time this website is commision free.",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
