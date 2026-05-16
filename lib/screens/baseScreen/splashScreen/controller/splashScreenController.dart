import 'package:get/get.dart';
import 'package:personal_template/routes/app_routes.dart';

class SplashController extends GetxController {
  void navigateToWelcome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.signInScreen);
    });
  }
}
