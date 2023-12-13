import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/utils/themes.dart';

class CustomOutlineButton extends StatelessWidget {
  Color fillColor;
  String buttonText;
  VoidCallback onPressed;
  Color textColor;

  CustomOutlineButton({
    super.key,
    required this.buttonText,
    required this.fillColor,
    required this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: textColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
