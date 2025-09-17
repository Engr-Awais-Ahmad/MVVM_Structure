import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/auth_field_decoration.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/social_button.dart';
import 'package:mvvm_app/ui/screens/auth/login/login_view_model.dart';
import 'package:provider/provider.dart';

class Login2Screen extends StatelessWidget {
  const Login2Screen({super.key});

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
                children: <Widget>[
                  Image.asset("$staticAssets/app_logo.png", scale: 6),
                  30.verticalSpace,
                  Text("Welcome Back", style: style30),
                  Text("Login to Continue!", style: style12),
                  50.verticalSpace,

                  ///
                  /// Email
                  ///
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
                  30.verticalSpace,

                  ///
                  /// Password
                  ///
                  TextFormField(
                    style: style16,
                    obscureText: model.isSelect,
                    decoration: authFieldDecoration.copyWith(
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          model.onClick();
                        },
                        child: Icon(
                          model.isSelect
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: greyColor,
                        ),
                      ),
                      prefixIcon: Image.asset("$iconAssets/lock.png", scale: 4),
                    ),
                  ),
                  Text("Forget Password?", style: style12),
                  30.verticalSpace,

                  ///
                  /// Custom Button
                  ///
                  CustomButton(
                    text: "Login",
                    onTap: () {},
                    boxColor: greenColor,
                    textColor: whiteColor,
                  ),
                  30.verticalSpace,

                  CustomButton(
                    text: "Create New Account",
                    onTap: () {},
                    boxColor: Colors.black,
                    textColor: greenColor,
                  ),
                  30.verticalSpace,

                  Center(
                    child: Text(
                      "C o n n e c t    W i t h",
                      style: style12.copyWith(color: greyColor),
                    ),
                  ),
                  30.verticalSpace,

                  ///
                  /// Social Button
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SocialButton(
                        onTap: () {},
                        assetImage: Image.asset(
                          "$iconAssets/apple.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                      20.horizontalSpace,
                      SocialButton(
                        onTap: () {},
                        assetImage: Image.asset(
                          "$iconAssets/facebook.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                      20.horizontalSpace,
                      SocialButton(
                        onTap: () {},
                        assetImage: Image.asset(
                          "$iconAssets/google.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
