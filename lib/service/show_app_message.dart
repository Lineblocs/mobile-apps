import 'package:get/get.dart';
import 'package:flutter/material.dart';


enum SnackBarType { error, success, normal }

class ShowAppMessage {
  static void showMessage(String message,bool status,
      {SnackBarType snackBarType = SnackBarType.success}) {
    switch (snackBarType) {
      case SnackBarType.error:
        showErrorSnackBar(message);
        break;
      case SnackBarType.normal:
        showNormalSnackBar(message);
        break;
      case SnackBarType.success:
        showSuccessSnackBar(message,status);
        break;
    }
  }

  static showErrorSnackBar(String message) {
    Get.closeCurrentSnackbar();
    Get.snackbar('Error', message,
        barBlur: 7,
        colorText: Colors.white,
        backgroundColor: Colors.red.withOpacity(.8),
        overlayColor: Colors.white);
  }

  static showNormalSnackBar(String message) {
    Get.closeCurrentSnackbar();
    Get.snackbar('', message,
      barBlur: 7,
      /*colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        overlayColor: Colors.white*/);
  }

  static showSuccessSnackBar(String message,bool status) {
    Get.closeCurrentSnackbar();
    Get.snackbar(status == true ? 'Success' : 'Error', message,
        barBlur: 7,
        colorText: Color(0xFF0f5132),
        backgroundColor: status == true ?Color(0xFFd1e7dd) : Colors.red,
        overlayColor: Colors.white);
  }
}