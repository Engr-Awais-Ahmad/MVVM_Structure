import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/screens/help_screen/help_screen_view_model.dart';

import 'package:provider/provider.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HelpScreenViewModel>(context);

    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: whiteColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const Spacer(),

              // Mailbox Icon
              Image.asset(
                "$iconAssets/mailbox.png",
                height: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

              // Title
              const Text(
                "How Can We Help You?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: whiteColor,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              // Subtitle
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                "sed do eiusmod tempor incididunt ut labore.",
                style: TextStyle(fontSize: 14, color: greyColor),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Message us",
                      assetImage: "$iconAssets/messagegreen2.png",
                      boxColor: greyColor,
                      textColor: whiteColor,
                      onTap: vm.onMessageTap,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      text: "Email us",
                      assetImage: "$iconAssets/emailgreen2.png",
                      boxColor: greyColor,
                      textColor: whiteColor,
                      onTap: vm.onEmailTap,
                    ),
                  ),
                ],
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
