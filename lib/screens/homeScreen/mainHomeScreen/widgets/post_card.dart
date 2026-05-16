import 'package:facebook_app_design_practice/constant/app_assert_image.dart';
import 'package:facebook_app_design_practice/constant/app_const_string.dart';
import 'package:facebook_app_design_practice/utils/gap.dart';
import 'package:facebook_app_design_practice/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String timeAgo;
  final String? postImage;
  final String? postText;
  final int likeCount;
  final int commentCount;
  final int shareCount;

  const PostCard({
    super.key,
    required this.userName,
    required this.timeAgo,
    this.postImage,
    this.postText,
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 20.sp),
                ),
                Gap(height: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: userName,
                            textSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.black,
                          ),
                          Gap(width: 4,),
                          Icon(Icons.verified, color: const Color(0xFF1877F2), size: 14.sp),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: "$timeAgo${ConstString.hour} · ",
                            textSize: 12.sp,
                            textColor: Colors.grey,
                          ),
                          Icon(Icons.public, size: 12.sp, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.black, size: 22.sp),
                Gap(width: 4,),
                Icon(Icons.close, color: Colors.black, size: 22.sp),
              ],
            ),
          ),

          // Post Image
          if (postImage != null)
            Image.asset(
             ConstAssertImage.prizeImg
            ),

          // Post Text
          if (postText != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: CustomText(
                title: postText!,
                textSize: 14.sp,
                textColor: Colors.black,
              ),
            ),

          // Like/Comment count row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, color: const Color(0xFF1877F2), size: 16.sp),
                    Gap(width: 4,),
                    CustomText(
                      title: "$likeCount",
                      textSize: 13.sp,
                      textColor: Colors.grey,
                    ),
                  ],
                ),
                CustomText(
                  title: "$commentCount ${ConstString.comment} · $shareCount ${ConstString.share}",
                  textSize: 13.sp,
                  textColor: Colors.grey,
                ),
              ],
            ),
          ),

          Divider(height: 1.h, color: const Color(0xFFE4E6EB)),

          // Action buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton(Icons.thumb_up_outlined, ConstString.like),
                _actionButton(Icons.chat_bubble_outline, ConstString.comment),
                _actionButton(Icons.reply_outlined, ConstString.share),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[700], size: 20.sp),
      label: CustomText(
        title: label,
        textSize: 13.sp,
        textColor: Colors.grey[700]!,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}