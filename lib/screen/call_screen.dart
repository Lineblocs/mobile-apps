// lib/screen/call_receive_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/controller/theme_controller.dart';
import 'package:lineblocs/screen/call_receive_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../widget/comman_widget.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  ThemeController  themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:themeController.isDarkMode.value ? null :
      AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
             Text(
              'Caller Name',
              style: AppFonts.boldTextStyle(
                fontSize: 30.0,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: 5),
             Text(
              'Incoming call...',
              style: AppFonts.boldTextStyle(
                fontSize: 15.0,
                color: AppColor.white,
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(CallReceiveScreen());
                  },
                  child: buildCircleButton(Icons.call, AppColor.white, AppColor.green,'Receive'),
                ),
                buildCircleButton(Icons.message, AppColor.white, AppColor.yellow4,'Message'),
                buildCircleButton(Icons.call_end, AppColor.white, AppColor.red,'End call'),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}