import 'package:get/get.dart';

class HomeController extends GetxController {
  // Tab Index
  final RxInt selectedTab = 0.obs;

  // Posts list (dummy)
  final RxList posts = [].obs;

  // Stories list (dummy)
  final RxList stories = [].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
}