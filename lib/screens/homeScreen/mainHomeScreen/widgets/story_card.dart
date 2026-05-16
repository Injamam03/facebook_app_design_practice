import 'package:facebook_app_design_practice/constant/app_const_string.dart';
import 'package:facebook_app_design_practice/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StoryCard extends StatelessWidget {
  final String? imagePath;
  final String? userName;
  final String? profileImage;
  final bool isCreateStory;

  const StoryCard({
    super.key,
    this.imagePath,
    this.userName,
    this.profileImage,
    this.isCreateStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: imagePath != null
            ? DecorationImage(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        )
            : null,
        color: const Color(0xFFE4E6EB),
      ),
      child: Stack(
        children: [
          // Bottom gradient
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),

          if (isCreateStory)
          // Create story layout
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF1877F2),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.r),
                      child: Icon(Icons.add, color: Colors.white, size: 24.sp),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: CustomText(
                    title: ConstString.createStory,
                    textSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          else
          // User story layout
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: CircleAvatar(
                    radius: 18.r,
                    backgroundImage: profileImage != null
                        ? AssetImage(profileImage!)
                        : null,
                    backgroundColor: const Color(0xFF1877F2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.r),
                  child: CustomText(
                    title: userName ?? "",
                    textSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}