import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, Value, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// ✅ Background Video
                Positioned.fill(
                  child: Value.isVideoInitialized
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: Value.videoController.value.size.width,
                            height: Value.videoController.value.size.height,
                            child: VideoPlayer(Value.videoController),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),

                /// ✅ Foreground UI (Buttons, Text, Icons, etc.)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("$staticAssets/app_logo.png", height: 40),
                          Row(
                            children: [
                              Image.asset(
                                "$iconAssets/search-icon.png",
                                height: 28,
                              ),
                              const SizedBox(width: 12),
                              Image.asset("$iconAssets/menu.png", height: 28),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "SAVO Kids",
                              onTap: () => Value.tabSelected(0),
                              boxColor: Value.selectedTabIndex == 0
                                  ? greenColor
                                  : whiteColor,
                              textColor: Value.selectedTabIndex == 0
                                  ? whiteColor
                                  : blackColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomButton(
                              text: "SAVO Senior",
                              onTap: () => Value.tabSelected(1),
                              boxColor: Value.selectedTabIndex == 1
                                  ? greenColor
                                  : whiteColor,
                              textColor: Value.selectedTabIndex == 1
                                  ? whiteColor
                                  : blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "529 College Savings Plan vs. Annuities",
                                    style: style12.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  const Text(
                                    "What plan will work best for your child’s tuition.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 6),
                                  const Text(
                                    "Jonathon Doe · 3 days ago",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 16,
                                bottom: 40,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "$staticAssets/avatar.png",
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  GestureDetector(
                                    onTap: Value.like,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Value.isLiked
                                          ? Colors.red
                                          : whiteColor,
                                      size: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "12k",
                                    style: style12.copyWith(color: whiteColor),
                                  ),
                                  const SizedBox(height: 16),
                                  const Icon(
                                    Icons.comment,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "786",
                                    style: style12.copyWith(color: whiteColor),
                                  ),
                                  const SizedBox(height: 16),
                                  const Icon(
                                    Icons.share,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
