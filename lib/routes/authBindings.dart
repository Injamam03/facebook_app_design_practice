import 'package:facebook_app_design_practice/screens/baseScreen/authScreen/sign_in/controller/sign_in_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../screens/homeScreen/mainHomeScreen/controller/mainHomeController.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<SignUpController>(() => SignUpController());
    // Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    // Get.lazyPut<ForgotVeriyOtpController>(() => ForgotVeriyOtpController());
    // Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
    // Get.lazyPut<SignUpOtpController>(() => SignUpOtpController());
  }
}
