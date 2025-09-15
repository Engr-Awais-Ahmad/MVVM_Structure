import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class selectBox extends StatelessWidget {
  VoidCallback? onTap;
  Color? color;
  selectBox({super.key, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(color: color, width: 100, height: 100),
    );
  }
}
