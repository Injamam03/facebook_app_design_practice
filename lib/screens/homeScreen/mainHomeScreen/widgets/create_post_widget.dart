import 'package:facebook_app_design_practice/constant/app_const_string.dart';
import 'package:facebook_app_design_practice/utils/gap.dart';
import 'package:facebook_app_design_practice/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreatePostWidget extends StatelessWidget {
  const CreatePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage("assets/images/img.png"),
          ),
          Gap(width: 4,),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFCED0D4)),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: CustomText(
                  title: ConstString.whatsOnYourMind,
                  textSize: 14.sp,
                  textColor: Colors.grey,
                ),
              ),
            ),
          ),
          Gap(width: 4,),
          Icon(Icons.photo_library, color: Colors.green, size: 28.sp),
        ],
      ),
    );
  }
}