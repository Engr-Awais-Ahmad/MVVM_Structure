import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/text_style.dart';

class ChannelScreen extends StatelessWidget {
  const ChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Channel Screen", style: style24.copyWith(color: whiteColor)),
    );
  }
}
