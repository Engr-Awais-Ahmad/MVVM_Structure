// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/social_button.dart';
import 'package:mvvm_app/ui/screens/auth/login/login_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatelessWidget {
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
                  Image.asset("$iconAssets/greenemail.png", scale: 6),
                  30.verticalSpace,
                  Text("Verify OTP", style: style30),
                  30.verticalSpace,
                  Text(
                    "Please enter OTP that we have sent you on sele********d123@gmail.com",
                    style: style16.copyWith(color: greyColor),
                  ),
                  30.verticalSpace,
                  Pinput(
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*', // use * instead of dot

                    obscuringWidget: const Text(
                      '*',
                      style: TextStyle(
                        fontSize: 20, // adjust size
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // match your style
                      ),
                    ),

                    onSubmitted: (value) {},
                    defaultPinTheme: PinTheme(
                      textStyle: style16,
                      width: 56,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: greenColor,
                          ), // underline only
                        ),
                      ),
                    ),
                  ),
                  40.verticalSpace,

                  ///
                  /// Custom Button
                  ///
                  CustomButton(text: "Verify", onTap: () {}),
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
