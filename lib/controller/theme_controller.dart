import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/theme_service.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    getTheme();

    super.onInit();
  }

  getTheme() async {
    isDarkMode.value = await ThemeService().isDarkMode();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    ThemeService().saveTheme(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}