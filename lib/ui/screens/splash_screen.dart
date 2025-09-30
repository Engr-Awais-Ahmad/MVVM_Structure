import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/screens/auth/login/login_screen.dart';
import 'package:mvvm_app/ui/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        ), // your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "$staticAssets/app_logo.png",
          width: 207,
          height: 77,
        ),
      ),
    );
  }
}
