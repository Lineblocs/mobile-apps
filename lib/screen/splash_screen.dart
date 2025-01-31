import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lineblocs/screen/auth/login_screen.dart';
import 'package:lineblocs/screen/dashboard.dart';
import 'package:sip_ua/sip_ua.dart';

import '../utils/assets_images.dart';
import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';

import 'intro/intro_second_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen(this._helper, {Key? key}) : super(key: key);
  final SIPUAHelper? _helper;
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
        Navigator.pushReplacementNamed(context, '/dashboard', arguments: {
          "helper": widget._helper
        });
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
