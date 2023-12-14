import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/firebase.dart';
import 'package:my_web_app/utils/themes.dart';

class ApplicationScreen extends StatefulWidget {

  String documentID;

  ApplicationScreen({super.key, required this.documentID});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {

  TextEditingController descriptionController = TextEditingController();

  CollectionReference<Map<String, dynamic>> database =
      FirebaseFirestore.instance.collection("portals");

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          width: getScreenWidth(context) * 0.40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Write a discription for the, why you are best suted for this work",
                style: GoogleFonts.poppins(color: black, fontSize: 20, fontWeight: FontWeight.w600,),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: descriptionController,
                    cursorColor: green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 2)),
                      hintText: "Discription under 200 words",
                    ),
                    maxLength: 200,
                    maxLines: 3,
                    minLines: 3,
                  ),

          


                ],
              ),
              SizedBox(
                height: 30,
              ),

              // button
              GestureDetector(
                onTap: () async {
                  try{
                                      await database.doc(widget.documentID).collection("applications").doc(FirebaseAuth.instance.currentUser!.uid).set({
                    "email": FirebaseAuth.instance.currentUser!.email,
                    "discription": descriptionController.text.trim()
                  });
                  Navigator.pop(context);
                  sucessMessage("Your Application is sucessfully submited", context);
                  } on FirebaseException catch (e){
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
                      child: isLoading
                            ? loding()
                            :  Text(
                        "Apply",
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
