import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopiee/main.dart';
import 'package:shopiee/screens/home_screen.dart';
import 'package:shopiee/screens/splash_screen1.dart';
import 'package:shopiee/widgets/localdb/databasehelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Wait a bit for splash animation
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString("name");

    // Navigate based on login state
    if (username == null || username.isEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen1()),
      );
    } else {
      final existingUser = await DatabaseHelper().getUserByName(username);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userData: existingUser),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          height: 100.sp,
          width: 100.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 236, 236, 236),
            image: DecorationImage(image: AssetImage("assets/image/logo.png")),
          ),
          // child: Image.asset("assets/image/logo.png", fit: BoxFit.contain),
        ),
      ),
    );
  }
}
