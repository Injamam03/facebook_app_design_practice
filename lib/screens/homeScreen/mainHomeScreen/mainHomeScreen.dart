
import 'package:facebook_app_design_practice/screens/homeScreen/mainHomeScreen/widgets/create_post_widget.dart';
import 'package:facebook_app_design_practice/screens/homeScreen/mainHomeScreen/widgets/home_app_bar.dart';
import 'package:facebook_app_design_practice/screens/homeScreen/mainHomeScreen/widgets/home_tab_bar.dart';
import 'package:facebook_app_design_practice/screens/homeScreen/mainHomeScreen/widgets/post_card.dart';
import 'package:facebook_app_design_practice/screens/homeScreen/mainHomeScreen/widgets/story_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller/mainHomeController.dart';

class MainHomeScreen extends GetView<HomeController> {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E6EB),
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          const HomeTabBar(),
          Expanded(
            child: ListView(
              children: [
                const CreatePostWidget(),
                const StorySection(),
                const PostCard(
                  userName: "Channel 24",
                  timeAgo: "1",
                  postImage: "assets/images/post1.png",
                  likeCount: 607,
                  commentCount: 11,
                  shareCount: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}