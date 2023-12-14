
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_web_app/utils/constants.dart';

CollectionReference<Map<String, dynamic>> database = FirebaseFirestore.instance.collection("portals");

void addNewPortal(String userID, String title, String discription, BuildContext context) async {
  await database.doc(userID).set({
    "title" : title,
    "discription": discription,
  });

  sucessMessage("Portal Added Sucessfully", context);
}