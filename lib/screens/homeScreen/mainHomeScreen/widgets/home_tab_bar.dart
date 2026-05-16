import 'package:facebook_app_design_practice/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/mainHomeController.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final tabs = [
      Icons.home,
      Icons.smart_display_outlined,
      Icons.people_alt_outlined,
      Icons.notifications_none_rounded,
      Icons.account_circle_outlined,
    ];

    return Container(
      color: Colors.white,
      child: Obx(() => Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = controller.selectedTab.value == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected
                          ? const Color(0xFF1877F2)
                          : Colors.transparent,
                      width: 2.5.h,
                    ),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      tabs[index],
                      size: 26.sp,
                      color: isSelected
                          ? const Color(0xFF1877F2)
                          : Colors.grey,
                    ),
                    // Notification badge (only for index 3)
                    if (index == 3)
                      Positioned(
                        top: 0,
                        right: 20.w,
                        child: Container(
                          padding: EdgeInsets.all(3.r),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: CustomText(
                            title: "14",
                            textSize: 8.sp,
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      )),
    );
  }
}