import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lineblocs/screen/auth/login_screen.dart';

import '../utils/assets_images.dart';
import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';

import 'intro/intro_second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isInternet = false;

  @override
  void initState() {
    init();
  }

  init() async {
    Timer(const Duration(seconds: 2), () async {
      String token = PreferencesManager.getString(PreferencesKey.accessToken);
      print('Token: $token');
      if (token.isEmpty) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  LoginScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  OnboardingScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: 100,
              width: 300,
              // color: AppColor.primaryColor,
              child: Center(
                child: Image.asset(AppImages.logo),
              ),
            ),
          ),
          // isInternet
          //     ? SizedBox()
          //     : commonLoading()
        ],
      ),
    );
  }
}
