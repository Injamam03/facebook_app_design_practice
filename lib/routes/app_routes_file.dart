import 'package:get/get.dart';
import 'package:personal_template/routes/app_routes.dart';
import 'package:personal_template/routes/authBindings.dart';
import 'package:personal_template/screens/baseScreen/authScreen/sign_in/sign_in_screen.dart';
import 'package:personal_template/screens/baseScreen/splashScreen/splashScreen.dart';

class AppRoutesFile {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
      binding: AuthBindings(),
    ),

    // // Profile pages
    // GetPage(name: AppRoutes.aboutUsScreen, page: () => const AboutUsScreen()),
    // GetPage(name: AppRoutes.changePasswordScreen, page: () => const ChangePasswordScreen()),
    // GetPage(name: AppRoutes.contactSupportScreen, page: () => const ContactSupportScreen()),
    // GetPage(name: AppRoutes.editProfileScreen, page: () => const EditProfileScreen()),
    // GetPage(name: AppRoutes.faqScreen, page: () => const FaqScreen()),
    // GetPage(name: AppRoutes.languageScreen, page: () => const LanguageScreen()),
    // GetPage(name: AppRoutes.privacyPolicyScreen, page: () => const PrivacyPolicyScreen()),
    // GetPage(name: AppRoutes.termsAndConditionsScreen, page: () => const TermsAndconditionsScreen()),
  ];
}
