import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/auth_field_decoration.dart';
import 'package:mvvm_app/core/constant/colors.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/screens/Videos_screen/your_vidoes_view_model.dart';
import 'package:provider/provider.dart';

class YourVideosScreen extends StatelessWidget {
  const YourVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => YourVideosViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<YourVideosViewModel>(
            builder: (context, model, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    _buildHeader(context, model),
                    24.verticalSpace,
                    _buildSearchBar(model),
                    24.verticalSpace,
                    Text(
                      '${model.filteredVideos.length} Videos',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.sp,
                      ),
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: ListView.builder(
                        itemCount: model.filteredVideos.length,
                        itemBuilder: (context, index) {
                          final video = model.filteredVideos[index];
                          return _videoTile(model, video);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ================= Header =================
  Widget _buildHeader(BuildContext context, YourVideosViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => model.onBack(context),
          child: Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                '$iconAssets/arrow-left-icon.png',
                width: 18.w,
                height: 18.w,
                color: whiteColor,
              ),
            ),
          ),
        ),
        12.verticalSpace,
        Text(
          'Your Videos',
          style: TextStyle(
            color: whiteColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ================= Search Bar =================
  Widget _buildSearchBar(YourVideosViewModel model) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: searchFieldDecoration.copyWith(
        hintText: 'Search',
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(
            '$iconAssets/search-icon.png',
            width: 20.w,
            height: 20.w,
            color: const Color(0xff737B80),
          ),
        ),
      ),
      onChanged: model.updateSearch,
    );
  }

  // ================= Video Tile =================
  Widget _videoTile(YourVideosViewModel model, VideoItem video) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  video.img,
                  width: 120.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    video.duration,
                    style: TextStyle(color: whiteColor, fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Text(
                  video.author,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () => model.onMenuTap(video),
          ),
        ],
      ),
    );
  }
}
