// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/auth_field_decoration.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/social_button.dart';
import 'package:mvvm_app/ui/screens/auth/login/login_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class ForgetPasswordOtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(backgroundColor: blackColor),

          ///
          /// Start Body
          ///
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset("$iconAssets/greenlock.png", scale: 6),
                  ),
                  30.verticalSpace,
                  Text("Forgot Password", style: style30),
                  30.verticalSpace,
                  Text(
                    "Please enter your registered email, We will send you OTP",
                    style: style16.copyWith(color: greyColor),
                  ),
                  30.verticalSpace,
                  TextFormField(
                    style: style16,
                    decoration: authFieldDecoration.copyWith(
                      labelText: "Email",
                      suffixIcon: Image.asset(
                        "$iconAssets/tick-circle.png",
                        scale: 4,
                      ),
                      prefixIcon: Image.asset(
                        "$iconAssets/email.png",
                        scale: 4,
                      ),
                    ),
                  ),
                  40.verticalSpace,

                  ///
                  /// Custom Button
                  ///
                  CustomButton(text: "Send OTP", onTap: () {}),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
