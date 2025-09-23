import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/screens/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, homeVM, _) {
          return Scaffold(
            body: Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.asset(
                    "$staticAssets/homescreenman.png",
                    fit: BoxFit.cover,
                  ),
                ),

                Column(
                  children: [
                    // 🔹 Top Bar (Logo + Icons)
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

                    // 🔹 Tabs SAVO Kids & Senior
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("SAVO Kids"),
                          ),
                        ),
                        SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "SAVO Senior",
                              style: TextStyle(color: blackColor),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 🔹 Middle Content (Title + Subtitle + Author)
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
                                children: const [
                                  Text(
                                    "529 College Savings Plan vs. Annuities",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "What plan will work best for your child’s tuition.",
                                    style: TextStyle(color: whiteColor),
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

                          // 🔹 Right Side Column (Avatar + Buttons)
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
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      "$staticAssets/avatar.png",
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  GestureDetector(
                                    onTap: homeVM.toggleLike,
                                    child: Icon(
                                      Icons.favorite,
                                      color: homeVM.isLiked
                                          ? Colors.red
                                          : whiteColor,
                                      size: 32,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "12k",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  const Icon(
                                    Icons.comment,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    "786",
                                    style: TextStyle(
                                      color: whiteColor,
                                      fontSize: 12,
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
    );
  }
}
