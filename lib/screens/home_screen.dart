import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_app/screens/add_portal_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/screens/signup_screen.dart';
import 'package:my_web_app/utils/constants.dart';
import 'package:my_web_app/utils/themes.dart';
import 'package:my_web_app/widgets/custom_fill_button.dart';
import 'package:my_web_app/widgets/custom_outline_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Text(
                    "Explore",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My portals",
                    style: navBarStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "My work",
                    style: navBarStyle,
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
          "hourly",
          style: GoogleFonts.pacifico(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("portals").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List? data = snapshot.data?.docs;

            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {

                DocumentSnapshot singlePortal = data?[index];
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                            singlePortal["title"],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(singlePortal["price"]),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Details"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}
