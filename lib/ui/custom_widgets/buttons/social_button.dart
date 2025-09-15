import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';

// ignore: must_be_immutable
class SocialButton extends StatelessWidget {
  VoidCallback? onTap;
  Image? assetImage;
  SocialButton({super.key, required this.onTap, required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(backgroundColor: whiteColor, child: assetImage),
    );
  }
}
