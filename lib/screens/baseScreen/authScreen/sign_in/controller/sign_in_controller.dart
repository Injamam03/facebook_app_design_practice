import 'package:facebook_app_design_practice/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// 👇 CHANGED FROM LoginController TO SignInController
class SignInController extends GetxController {
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  final RxBool isPasswordHidden = true.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onLogin() {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(150),
        colorText: Colors.white,
      );
      return;
    }

    // Get.offAllNamed(AppRoutes.mainScreen);
    // TODO Add your login API call here
  }

  void onForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void onSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  @override
  void onClose() {
    // It is good practice to uncomment these to prevent memory leaks!
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
