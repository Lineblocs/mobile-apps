import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/auth/login_screen.dart';
import 'package:lineblocs/screen/splash_screen.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/utils/shared_preferences/preferences_manager.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  await PreferencesManager.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (a, b, c) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(),
      );
    });
  }
}
