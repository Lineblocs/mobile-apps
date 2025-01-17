import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/splash_screen.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/utils/shared_preferences/preferences_manager.dart';
import 'package:sizer/sizer.dart';

import 'controller/theme_controller.dart';

Future<void> main() async {
  final ThemeController themeController = Get.put(ThemeController());
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: themeController.isDarkMode.value ? null :
    AppColor.primaryColor,
    statusBarIconBrightness: Brightness.dark,
  ));
  await PreferencesManager.getInstance();
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return  Obx(() {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
          home: SplashScreen(),
        );
      });
    });
  }
}
