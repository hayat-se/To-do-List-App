import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summers_learning_1/Week1/LoginScreen.dart';

import '../Week_2/routes/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus(); //
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences db = await SharedPreferences.getInstance();
    bool isLoggedIn = db.getBool("isLoggedIn") ?? false;

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return isLoggedIn ? HomeScreen() : LoginScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: Center(child: Image(image: AssetImage("assets/images/logo.png"))),
    );
  }
}
