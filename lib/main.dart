import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/ui/screens/auth/forget_password_otp/forget_password_otp.dart';
import 'package:mvvm_app/ui/screens/auth/login2/login2_screen.dart.dart';
import 'package:mvvm_app/ui/screens/auth/verify_otp/verify_otp_screen.dart';
import 'package:mvvm_app/ui/screens/help_screen/help_screen.dart';
import 'package:mvvm_app/ui/screens/home_screen/home_screen.dart';
import 'package:mvvm_app/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:mvvm_app/ui/screens/home_screen/savo_kids_screen.dart';
import 'package:mvvm_app/ui/screens/home_screen/savo_senior_screen.dart';
import 'package:mvvm_app/ui/screens/root_screen/root_screen.dart';
import 'package:mvvm_app/ui/screens/splash_screen.dart';
import 'package:mvvm_app/ui/screens/subscription/plans/subscription_plans_screen.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: blackColor,
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SavoSeniorScreen(),
    );
  }
}
