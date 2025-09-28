import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SavoSeniorScreenViewModel extends ChangeNotifier {
  bool isLiked = false;
  int selectedTabIndex = 0;

  late VideoPlayerController videoController;
  bool isVideoInitialized = false;

  SavoSeniorScreenViewModel() {
    initVideo();
  }

  /// Initialize senior-related video
  Future<void> initVideo() async {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4", // ✅ Replace with senior-related video URL
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
