import 'package:flutter/material.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/models/course_model.dart';

class CoursesViewModel extends ChangeNotifier {
  /// ✅ Static assets
  final String logoPath = "$staticAssets/app_logo.png";
  final String searchIcon = "$iconAssets/search-icon.png";
  final String menuIcon = "$iconAssets/menu.png";

  /// ✅ Title
  final String coursesTitle = "Courses";

  /// ✅ Courses list
  final List<Course> courses = [
    Course(
      image: "$staticAssets/course1.png",
      title: "Learning strategy: Mutual fund or Stocks",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..",
    ),
    Course(
      image: "$staticAssets/course2.png",
      title: "Learn how to use constraint in financial planning",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..",
    ),
    Course(
      image: "$staticAssets/course3.png",
      title: "How to invest in mutual fund for best returns",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..",
    ),
    Course(
      image: "$staticAssets/course4.png",
      title: "Which one is better? Real Estate or Equity",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..",
    ),
    Course(
      image: "$staticAssets/course5.png",
      title: "How to start investing in Stock market?",
      subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit..",
    ),
  ];
}
