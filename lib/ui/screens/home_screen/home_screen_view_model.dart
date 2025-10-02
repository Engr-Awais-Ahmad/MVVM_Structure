import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:video_player/video_player.dart';

class SavoKidsScreenViewModel extends ChangeNotifier {
  bool isLiked = false;
  int selectedTabIndex = 0;

  late VideoPlayerController videoController;
  bool isVideoInitialized = false;

  SavoKidsScreenViewModel() {
    initVideo();
  }

  /// Initialize video from URL
  Future<void> initVideo() async {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      ),
    );

    await videoController.initialize();
    videoController.setLooping(true);
    videoController.play();

    isVideoInitialized = true;
    notifyListeners();
  }

  void like() {
    isLiked = !isLiked;
    notifyListeners();
  }

  void tabSelected(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}

///  model for drawer items
class DrawerItem {
  final String title;
  final String icon;
  final String trailingIcon;
  DrawerItem({
    required this.title,
    required this.icon,
    required this.trailingIcon,
  });
}

final List<DrawerItem> mainItems = [
  DrawerItem(
    title: "My Profile",
    icon: "$iconAssets/person-profile-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Videos",
    icon: "$iconAssets/video-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Safety Deposit",
    icon: "$iconAssets/lock-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Discover",
    icon: "$iconAssets/search-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Vault",
    icon: "$iconAssets/vault-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Help",
    icon: "$iconAssets/message-question-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Channels",
    icon: "$iconAssets/channel-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
];
final List<DrawerItem> settingsItems = [
  DrawerItem(
    title: "Playlist",
    icon: "$iconAssets/music-playlist-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Settings",
    icon: "$iconAssets/setting2-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
  DrawerItem(
    title: "Notifications",
    icon: "$iconAssets/notification-icon.png",
    trailingIcon: "$iconAssets/forward-arrow-icon.png",
  ),
];
