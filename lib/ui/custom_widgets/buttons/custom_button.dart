// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Color? boxColor;
  final Color? textColor;
  final String? assetImage;

  const CustomButton({
    super.key,
    this.boxColor,
    this.text,
    this.textColor,
    this.assetImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: greenColor),
          color: boxColor ?? greenColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (assetImage != null) ...[
              Image.asset(
                assetImage!,
                height: 28,
                width: 28,
                color: greenColor,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              text ?? "Button",
              style: style16.copyWith(color: textColor ?? whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
