import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/strings.dart';

class VideoItem {
  final String img;
  final String title;
  final String author;
  final String duration;

  VideoItem({
    required this.img,
    required this.title,
    required this.author,
    required this.duration,
  });
}

class YourVideosViewModel extends ChangeNotifier {
  final List<VideoItem> _allVideos = [
    VideoItem(
      img: "$staticAssets/course1.png",
      title: 'Learning strategy: Mutual fund or Stocks',
      author: 'Selena Grande',
      duration: '3:25',
    ),
    VideoItem(
      img: "$staticAssets/course2.png",
      title: 'Learn how to use constraint in financial crisis.',
      author: 'Justin Gomez',
      duration: '3:25',
    ),
    VideoItem(
      img: "$staticAssets/course3.png",
      title: 'How to invest in mutual fund for best returns',
      author: 'Ariana Bieber',
      duration: '3:25',
    ),
    VideoItem(
      img: "$staticAssets/course4.png",
      title: 'Which one is better? Real Estate or Equity',
      author: 'Zayn Puth',
      duration: '3:25',
    ),
  ];

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  List<VideoItem> get filteredVideos {
    if (_searchQuery.isEmpty) return _allVideos;
    return _allVideos
        .where(
          (video) =>
              video.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              video.author.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void onBack(BuildContext context) {
    Navigator.pop(context);
  }

  void onMenuTap(VideoItem video) {}
}
