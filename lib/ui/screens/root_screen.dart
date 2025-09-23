import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/screens/root_screen_view_model.dart';
import 'package:provider/provider.dart';

// Import your screens
import 'home_screen.dart';
import 'courses_screen.dart';
import 'vault_screen.dart';
import 'channel_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        builder: (context, viewModel, _) {
          final List<Widget> screens = const [
            HomeScreen(),
            CoursesScreen(),
            VaultScreen(),
            ChannelScreen(),
          ];

          return Scaffold(
            body: screens[viewModel.selectedIndex],

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.onNavBarClick,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset("$iconAssets/home-icon.png", height: 24),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("$iconAssets/book-icon.png", height: 24),
                  label: "Courses",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("$iconAssets/vault-icon.png", height: 24),
                  label: "Vault",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset("$iconAssets/channel-icon.png", height: 24),
                  label: "Channel",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
