import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

/// Initializes the connectivity
Future<bool> checkInternetConnection({BuildContext? context}) async {
  bool resultBool = false;
  try {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      print('No internet connection');
      // showSnackBars(
      //     context!, TKeys.noInternetConnection.translate(), AppColor.red,
      //     duration: 3);
      resultBool = false;
    } else {
      print('Connected to internet');
      resultBool = true;
    }
  } catch (e) {
    print('Could not check connectivity status: $e');
  }
  return resultBool;
}

