import 'package:facebook_app_design_practice/routes/app_routes.dart';
import 'package:facebook_app_design_practice/routes/app_routes_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Cleaned up the GetX import
import 'package:get_storage/get_storage.dart'; // Required for GetStorage.init()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage after the binding
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // translations: AppTranslations(),

        initialRoute: AppRoutes.mainHomeScreen,

        // 👇 THIS IS THE FIX FOR NAVIGATION
        getPages: AppRoutesFile.routes,

        /// Smooth fade transition globally
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400),

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}