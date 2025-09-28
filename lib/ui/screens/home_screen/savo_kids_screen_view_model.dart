import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SavoKidsScreenViewModel extends ChangeNotifier {
  bool isLiked = false;
  int selectedTabIndex = 0;

  late VideoPlayerController videoController;
  bool isVideoInitialized = false;

  SavoKidsScreenViewModel() {
    initVideo();
  }

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
