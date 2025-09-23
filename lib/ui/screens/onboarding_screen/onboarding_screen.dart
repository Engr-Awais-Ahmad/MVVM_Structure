import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/custom_onboarding.dart';
import 'package:mvvm_app/ui/screens/auth/login/login_screen.dart';
import 'package:mvvm_app/ui/screens/onboarding_screen/onboarding_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbaordingScreen extends StatelessWidget {
  const OnbaordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnbaordingViewModel(),
      child: Consumer<OnbaordingViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    PageView.builder(
                      controller: value.pageController,
                      itemCount: value.items.length,
                      onPageChanged: value.onPageChanged,
                      itemBuilder: (context, index) {
                        return CustomOnboaring(
                          onbaordingItem: value.items[index],
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 59,
                        horizontal: 20,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text(
                          "Skip",
                          style: style16.copyWith(
                            color: blackColor,
                            decorationThickness: 3,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0, left: 30),
                child: SmoothPageIndicator(
                  controller: value.pageController, // PageController
                  count: value.items.length ?? 0,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: lightBlack,
                    activeDotColor: greenColor,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
