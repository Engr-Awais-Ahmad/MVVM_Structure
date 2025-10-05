import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/core/models/profile_model.dart';
import 'package:mvvm_app/ui/screens/profile_screen/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context),
                70.verticalSpace,
                _buildUserInfo(),
                25.verticalSpace,
                _buildStatsRow(),
                25.verticalSpace,
                _buildRecentSection(),
                25.verticalSpace,
                _menuSection(),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= Header =================
  Widget _buildHeader(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          '$staticAssets/cover-profile.png',
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.cover,
        ),

        // ✅ Back Button
        Positioned(
          top: 16.h,
          left: 16.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: _circleButton('$iconAssets/arrow-left-icon.png'),
          ),
        ),

        // ✅ Logout Button
        Positioned(
          top: 16.h,
          right: 16.w,
          child: _circleButton('$iconAssets/logout-icon.png'),
        ),

        // ✅ Profile Picture + Edit
        Positioned(
          top: 180.h,
          left: MediaQuery.of(context).size.width / 2 - 55.r,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 55.r,
                backgroundImage: AssetImage('$staticAssets/drawer-profile.png'),
              ),
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  height: 28.w,
                  width: 28.w,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.edit, color: Colors.white, size: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= User Info =================
  Widget _buildUserInfo() {
    return Column(
      children: [
        Text(
          'Selena Grande',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        4.verticalSpace,
        Text(
          'selenagrande@mail.com',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
        ),
      ],
    );
  }

  // ================= Stats Row =================
  Widget _buildStatsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _counterBox('582', 'Followers'),
          _counterBox('502', 'Following'),
          _counterBox('15', 'Videos'),
        ],
      ),
    );
  }

  Widget _counterBox(String number, String label) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          4.verticalSpace,
          Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }

  // ================= Recent Section =================
  Widget _buildRecentSection() {
    return Consumer<ProfileViewModel>(
      builder: (context, model, _) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 14.sp, color: Colors.green),
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: model.recentVideos.length,
                itemBuilder: (context, index) {
                  final item = model.recentVideos[index];
                  return _recentVideoCard(item);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _recentVideoCard(ProfileItemModel item) {
    return Container(
      width: 200.w,
      margin: EdgeInsets.only(right: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: Stack(
              children: [
                Image.asset(
                  item.img,
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      item.duration,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white70,
                    size: 40.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              item.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              item.subtitle,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  // ================= Menu Section =================
  Widget _menuSection() {
    return Column(
      children: [
        _menuTile('$iconAssets/video-play-icon.png', 'Your Videos'),
        _menuTile('$iconAssets/watchlater-icon.png', 'Watch Later'),
        _menuTile('$iconAssets/likevideo-icon.png', 'Liked Videos'),
        _menuTile('$iconAssets/music-playlist-icon.png', 'Playlist'),
      ],
    );
  }

  Widget _menuTile(String icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: Container(
        height: 36.w,
        width: 36.w,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(icon, width: 20.w, color: Colors.white),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
      ),
      onTap: () {},
    );
  }

  // ================= Helper Button =================
  Widget _circleButton(String iconPath) {
    return Container(
      height: 40.w,
      width: 40.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black54,
      ),
      child: Center(
        child: Image.asset(iconPath, height: 18.w, color: Colors.white),
      ),
    );
  }
}
