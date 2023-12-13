import 'package:flutter/material.dart';

class BulletPointTextWidget extends StatelessWidget {
  Color textColor;
  double fontSize;
  String text;
  BulletPointTextWidget({
    super.key,
    required this.fontSize,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.circle_rounded,
          size: fontSize - 10,
          color: textColor,
        ),
        SizedBox(width: fontSize,),
        Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
          
        )
      ],
    );
  }
}
