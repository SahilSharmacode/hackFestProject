import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/main.dart';
import 'package:my_web_app/screens/add_portal_screen.dart';
import 'package:my_web_app/screens/application_screen.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';

class MyPortalScreen extends StatefulWidget {
  const MyPortalScreen({super.key});

  @override
  State<MyPortalScreen> createState() => _MyPortalScreenState();
}

class _MyPortalScreenState extends State<MyPortalScreen> {
  FirebaseFirestore database = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: white,
        child: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 300,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: Text(
                      "Explore",
                      style: navBarStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPortalScreen(),
                          ));
                    },
                    child: Text(
                      "My portals",
                      style: navBarStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My work",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Work Submition",
                    style: GoogleFonts.poppins(
                      color: Colors.blue.withOpacity(0.6),
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              CustomFillButton(
                buttonText: "Add Portal",
                fillColor: green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPortalScreen(),
                    ),
                  );
                },
                textColor: white,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomOutlineButton(
                buttonText: "Sign Out",
                fillColor: white,
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ));
                },
                textColor: black,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: white,
        title: Text(
          "My job portal",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("portals")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("applications")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? data = snapshot.data?.docs;

            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot singlePortal = data?[index];

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: Offset(2, 2)),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            singlePortal["email"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            singlePortal["discription"],
                            style: TextStyle(overflow: TextOverflow.clip),
                          ),
                          Expanded(child: SizedBox()),
                          Divider(
                            height: 2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(color: green, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        "Accept",
                                        style: GoogleFonts.poppins(
                                          color: green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
