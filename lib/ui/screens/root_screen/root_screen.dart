import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/screens/root_screen/root_screen_view_model.dart';
import 'package:provider/provider.dart';
import '../home_screen/home_screen.dart';
import '../courses_screen/courses_screen.dart';
import '../vault_screen/vault_screen.dart';
import '../channel_screen/channel_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        // ignore: non_constant_identifier_names
        builder: (context, model, _) {
          final List<Widget> screens = [
            HomeScreen(),
            CoursesScreen(),
            VaultScreen(),
            ChannelScreen(),
          ];

          return Scaffold(
            body: screens[model.selectedIndex],

            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: model.selectedIndex,
              onTap: model.onClick,
              selectedItemColor: greenColor,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "$iconAssets/home-icon.png",
                    height: 24,
                    color: model.selectedIndex == 0 ? greenColor : Colors.grey,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "$iconAssets/book-icon.png",
                    height: 24,
                    color: model.selectedIndex == 1 ? greenColor : Colors.grey,
                  ),
                  label: "Courses",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "$iconAssets/vault-icon.png",
                    height: 24,
                    color: model.selectedIndex == 2 ? greenColor : Colors.grey,
                  ),
                  label: "Vault",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    "$iconAssets/channel-icon.png",
                    height: 24,
                    color: model.selectedIndex == 3 ? greenColor : Colors.grey,
                  ),
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
