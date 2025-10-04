import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/screens/subscription/plans/subscription_plans_view_model.dart';
import 'package:provider/provider.dart';

class SavoSubscriptionScreen extends StatelessWidget {
  const SavoSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SubscriptionPlansViewModel(),
      child: Consumer<SubscriptionPlansViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "$staticAssets/blackfamily.png",
                  scale: 3,
                  width: double.infinity,
                ),
                30.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text("SAVO Subscription", style: style16),
                ),
                10.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Whether you're a first time homebuyer or looking to diversify your investments, the SAVO community is here to help.",
                    style: style16.copyWith(fontSize: 13, color: greyColor),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _benefitItem(
                        "Customized access to classes, guides, trainings and coaching sessions.",
                      ),
                      _benefitItem(
                        "Change your Mindset. Change your Behavior.",
                      ),
                      _benefitItem(
                        "Join a community of like-minded generational wealth builders.",
                      ),
                      _benefitItem(
                        "Daily access to financial news and easy-to-understand analysis.",
                      ),
                      _benefitItem("... and much more!"),
                    ],
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButton(
                    text: "Choose Your Plan",
                    onTap: () {
                      // Handle button tap
                    },
                    boxColor: greenColor,
                    textColor: Colors.white,
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _benefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "$iconAssets/circletickgreen.png", // ✅ tick icon
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: style16.copyWith(fontSize: 13))),
        ],
      ),
    );
  }
}
