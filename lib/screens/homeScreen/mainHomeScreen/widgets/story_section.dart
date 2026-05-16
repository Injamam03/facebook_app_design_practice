import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'story_card.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        children: const [
          StoryCard(isCreateStory: true),
          StoryCard(
            imagePath: "assets/images/img.png",
            profileImage: "assets/images/img.png",
            userName: "Raihan Uddin",
          ),
          StoryCard(
            imagePath: "assets/images/story2.png",
            profileImage: "assets/images/profile2.png",
            userName: "Md Fahim Uddin Farhad",
          ),StoryCard(
            imagePath: "assets/images/story1.png",
            profileImage: "assets/images/profile1.png",
            userName: "Raihan Uddin",
          ),
          StoryCard(
            imagePath: "assets/images/story2.png",
            profileImage: "assets/images/profile2.png",
            userName: "Md Fahim Uddin Farhad",
          ),StoryCard(
            imagePath: "assets/images/story1.png",
            profileImage: "assets/images/profile1.png",
            userName: "Raihan Uddin",
          ),
          StoryCard(
            imagePath: "assets/images/story2.png",
            profileImage: "assets/images/profile2.png",
            userName: "Md Fahim Uddin Farhad",
          ),
        ],
      ),
    );
  }
}