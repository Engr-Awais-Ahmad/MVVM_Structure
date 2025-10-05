import 'package:flutter/foundation.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/models/profile_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final List<ProfileItemModel> _recentVideos = [
    ProfileItemModel(
      img: '$staticAssets/course1.png',
      title: 'How to manage your assets portfolio?',
      subtitle: '12k Views | 2 days ago',
      duration: '3:25',
    ),
    ProfileItemModel(
      img: '$staticAssets/courses6.png',
      title: 'Learn how to use constraint in financial crisis.',
      subtitle: '145k Views | 5 days ago',
      duration: '13:54',
    ),
    ProfileItemModel(
      img: '$staticAssets/course4.png',
      title: 'How to keep finances fun and exciting!',
      subtitle: '165k Views | 6 days ago',
      duration: '5:56',
    ),
  ];

  List<ProfileItemModel> get recentVideos => _recentVideos;
}
