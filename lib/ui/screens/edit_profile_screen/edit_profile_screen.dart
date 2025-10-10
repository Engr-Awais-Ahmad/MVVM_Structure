import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_app/core/constant/auth_field_decoration.dart';
import 'package:mvvm_app/core/constant/strings.dart';
import 'package:mvvm_app/ui/custom_widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';
import 'edit_profile_view_model.dart';
import 'package:mvvm_app/core/constant/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditProfileViewModel(),
      child: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: Consumer<EditProfileViewModel>(
            builder: (context, model, _) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    _buildCoverPhotoSection(model, context),
                    60.verticalSpace, // spacing for avatar overlap
                    _buildTextField(
                      controller: model.nameController,
                      hint: 'Full Name',
                      iconPath: "$iconAssets/user.png",
                    ),
                    20.verticalSpace,
                    _buildTextField(
                      controller: model.emailController,
                      hint: 'Email',
                      iconPath: "$iconAssets/email.png",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    20.verticalSpace,
                    _buildDateField(model, context),
                    40.verticalSpace,
                    _buildSaveButton(model),
                    20.verticalSpace,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCoverPhotoSection(
    EditProfileViewModel model,
    BuildContext context,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cover photo container
        GestureDetector(
          onTap: model.onCoverPhotoTap,
          child: Container(
            width: double.infinity,
            height: 150.w,
            decoration: BoxDecoration(
              color: greyColor, // use your defined greyColor
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "$iconAssets/camera-icon.png",
                    width: 40.w,
                    color: whiteColor,
                  ),
                  8.verticalSpace,
                  Text(
                    'Add Cover Photo',
                    style: TextStyle(color: whiteColor, fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Back arrow positioned at top-left
        Positioned(
          top: 10.w,
          left: 10.w,
          child: GestureDetector(
            onTap: () => model.onBack(context),
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                color: lightBlack,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "$iconAssets/arrow-left-icon.png",
                  width: 20.w,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        // Profile avatar overlapping bottom center
        Positioned(
          bottom: -45.w,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: model.onProfileImageTap,
            child: Container(
              height: 90.w,
              width: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: blackColor, width: 4),
                color: greyColor,
              ),
              child: Center(
                child: Image.asset(
                  "$iconAssets/cover-gallery-icon.png",
                  width: 30.w,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String iconPath,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: whiteColor),
      cursorColor: whiteColor,
      decoration: searchFieldDecoration.copyWith(
        hintText: hint,
        hintStyle: TextStyle(color: greyColor),
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.w),
          child: Image.asset(iconPath, width: 20.w, color: greyColor),
        ),
      ),
    );
  }

  Widget _buildDateField(EditProfileViewModel model, BuildContext context) {
    return GestureDetector(
      onTap: () => model.pickDate(context),
      child: AbsorbPointer(
        child: TextField(
          style: TextStyle(color: whiteColor),
          cursorColor: whiteColor,
          decoration: searchFieldDecoration.copyWith(
            hintText: 'Date of Birth',
            hintStyle: TextStyle(color: greyColor),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: Image.asset(
                "$iconAssets/calender-icon.png",
                width: 20.w,
                color: greyColor,
              ),
            ),
          ),
          controller: TextEditingController(text: model.dob),
        ),
      ),
    );
  }

  Widget _buildSaveButton(EditProfileViewModel model) {
    return CustomButton(
      onTap: model.onSave,
      text: "Save Changes",
      boxColor:
          null, // default color; you can update CustomButton to use linearGradient
      textColor: whiteColor,
      assetImage: null,
    );
  }
}
