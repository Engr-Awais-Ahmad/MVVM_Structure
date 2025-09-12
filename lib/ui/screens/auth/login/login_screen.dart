import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: blackColor),

      ///
      /// Start Body
      ///
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("$staticAssets/app_logo.png", scale: 6),
            SizedBox(height: 30),
            Text("Create Account", style: style30),
            SizedBox(height: 50),
            TextFormField(decoration: InputDecoration(labelText: "Email")),
          ],
        ),
      ),
    );
  }
}
