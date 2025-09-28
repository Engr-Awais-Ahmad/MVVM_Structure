import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class SavoKidsScreen extends StatelessWidget {
  SavoKidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SavoKidsScreenViewModel(),
      child: Consumer<SavoKidsScreenViewModel>(
        builder: (context, value, _) {
          return Scaffold(
            body: Stack(
              children: [
                /// ✅ Background Video
                Positioned.fill(
                  child: value.isVideoInitialized
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: value.videoController.value.size.width,
                            height: value.videoController.value.size.height,
                            child: VideoPlayer(value.videoController),
                          ),
                        )
                      : Center(child: CircularProgressIndicator()),
                ),

                /// ✅ SAME UI AS HOMESCREEN
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
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
                              SizedBox(width: 12),
                              Image.asset("$iconAssets/menu.png", height: 28),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "SAVO Kids",
                              onTap: () => value.tabSelected(0),
                              boxColor: value.selectedTabIndex == 0
                                  ? greenColor
                                  : whiteColor,
                              textColor: value.selectedTabIndex == 0
                                  ? whiteColor
                                  : blackColor,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: CustomButton(
                              text: "SAVO Senior",
                              onTap: () => value.tabSelected(1),
                              boxColor: value.selectedTabIndex == 1
                                  ? greenColor
                                  : whiteColor,
                              textColor: value.selectedTabIndex == 1
                                  ? whiteColor
                                  : blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 16, bottom: 40),
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
                                  SizedBox(height: 6),
                                  Text(
                                    "What plan will work best for your child’s tuition.",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
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
                              padding: EdgeInsets.only(right: 16, bottom: 40),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "$staticAssets/avatar.png",
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  GestureDetector(
                                    onTap: value.like,
                                    child: Icon(
                                      Icons.favorite,
                                      color: value.isLiked
                                          ? Colors.red
                                          : whiteColor,
                                      size: 32,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "12k",
                                    style: style12.copyWith(color: whiteColor),
                                  ),
                                  SizedBox(height: 16),
                                  Icon(
                                    Icons.comment,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "786",
                                    style: style12.copyWith(color: whiteColor),
                                  ),
                                  SizedBox(height: 16),
                                  Icon(
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
