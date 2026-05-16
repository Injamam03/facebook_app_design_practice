import 'package:facebook_app_design_practice/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.signInScreen);
    });
  }
}
