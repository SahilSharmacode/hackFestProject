import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/firebase.dart';
import 'package:my_web_app/utils/themes.dart';

class AddPortalScreen extends StatelessWidget {
  AddPortalScreen({super.key});
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  CollectionReference<Map<String, dynamic>> database = FirebaseFirestore.instance.collection("portals");

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
                "Enter your work description below",
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 30,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: titleController,
                      cursorColor: green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green, width: 2)),
                        hintText: "Title",
                      ),
                    ),

                    SizedBox(height: 20,),
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
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () async {
                    try{
                      await database.doc(FirebaseAuth.instance.currentUser!.uid).set({
                        "title": titleController.text.trim(),
                        "discription" : descriptionController.text.trim()
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      sucessMessage("Portal Added Sucessflut", context);

                    } catch(e){
                      print(e);
                      errorMessage("There is some error", context);
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
                          "New Portal",
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