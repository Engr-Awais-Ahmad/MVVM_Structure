import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:mvvm_app/ui/screens/home_screen/home_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _drawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      key: _drawerKey,
      slideDirection: SlideDirection.rightToLeft,
      sliderOpenSize: 280,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),

      ///  Drawer
      slider: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("$staticAssets/obaording1.png"),
            ),
            Center(
              child: Column(
                children: [
                  Text("Selena Grande", style: style24),
                  Text(
                    "selenagrande@gmail.com",
                    style: style24.copyWith(color: greyColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...mainItems.map(
              (item) => ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(item.icon, height: 35),
                ),
                title: Text(item.title, style: style16),
                trailing: Image.asset(item.trailingIcon, height: 20),
                onTap: () {},
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Settings",
              style: style16.copyWith(
                color: greyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            /// Settings items
            ...settingsItems.map(
              (item) => ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(item.icon, height: 35),
                ),
                title: Text(item.title, style: style16),
                trailing: Image.asset(item.trailingIcon, height: 20),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),

      ///  Main TikTok-style screen
      child: ChangeNotifierProvider(
        create: (_) => SavoKidsScreenViewModel(),
        child: Consumer<SavoKidsScreenViewModel>(
          builder: (context, value, _) {
            return Scaffold(
              backgroundColor: blackColor,
              body: Stack(
                children: [
                  /// Background Video
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
                        : const Center(child: CircularProgressIndicator()),
                  ),

                  Column(
                    children: [
                      ///  Header with drawer
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "$staticAssets/app_logo.png",
                              height: 40,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "$iconAssets/search-icon.png",
                                  height: 28,
                                ),
                                const SizedBox(width: 12),

                                /// Open/close Drawer here
                                GestureDetector(
                                  onTap: () {
                                    _drawerKey.currentState?.toggle();
                                  },
                                  child: Image.asset(
                                    "$iconAssets/menu.png",
                                    height: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// Tabs
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                            const SizedBox(width: 12),
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

                      const SizedBox(height: 20),

                      ///Video bottom overlays
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
                                      onTap: value.like,
                                      child: Icon(
                                        Icons.favorite,
                                        color: value.isLiked
                                            ? Colors.red
                                            : whiteColor,
                                        size: 32,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "12k",
                                      style: style12.copyWith(
                                        color: whiteColor,
                                      ),
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
                                      style: style12.copyWith(
                                        color: whiteColor,
                                      ),
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
      ),
    );
  }
}
