import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/colors.dart';

import 'package:mvvm_app/core/constant/text_style.dart';
import 'package:mvvm_app/ui/screens/courses_screen/courses_view_model.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoursesViewModel(),
      child: Consumer<CoursesViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,

                  /// ✅ TOP ROW → App logo + Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(model.logoPath, height: 40),
                      Row(
                        children: [
                          _headerIcon(Icons.search),
                          const SizedBox(width: 12),
                          _headerIcon(Icons.grid_view_rounded),
                        ],
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  /// ✅ Courses Title (below the top row)
                  Text(
                    model.coursesTitle,
                    style: style16.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),

                  20.verticalSpace,

                  /// ✅ Courses List
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.courses.length,
                      itemBuilder: (context, index) {
                        final course = model.courses[index];
                        return _courseItem(
                          image: course.image,
                          title: course.title,
                          subtitle: course.subtitle,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ✅ Same header icon style as screenshot
  Widget _headerIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  Widget _courseItem({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: style16.copyWith(color: greyColor, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
