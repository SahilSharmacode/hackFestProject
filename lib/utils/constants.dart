import 'package:flutter/material.dart';
import 'package:my_web_app/utils/themes.dart';


double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}


double getScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.width;
}


void errorMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.red,
          ),
          child: Center(
              child: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w400),
          ))),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

void sucessMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: green,
          ),
          child: Center(
              child: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w400),
          ))),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}


Widget loding(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: AspectRatio(
      aspectRatio: 1/1,
      child: CircularProgressIndicator(color: white,)),
  );
}