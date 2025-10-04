import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // 👈 Add this
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:mvvm_app/ui/screens/subscription/savo_subscription.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: blackColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SavoSubscriptionScreen(),
    );
  }
}
