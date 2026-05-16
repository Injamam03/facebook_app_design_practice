import 'package:facebook_app_design_practice/constant/app_const_string.dart';
import 'package:facebook_app_design_practice/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: CustomText(
        title: ConstString.facebook,
        textSize: 28.sp,
        fontWeight: FontWeight.bold,
        textColor: const Color(0xFF1877F2),
      ),
      actions: [
        _iconButton(Icons.add_box_outlined),
        _iconButton(Icons.search),
        _iconButton(Icons.messenger_outline_rounded),
      ],
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: const BoxDecoration(
        color: Color(0xFFE4E6EB),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 20.sp),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}