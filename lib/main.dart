import 'package:flutter/material.dart';
import 'package:my_web_app/screens/home_screen.dart';
import 'package:my_web_app/screens/login_screen.dart';
import 'package:my_web_app/widgets/layout_builder.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my web app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}