import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../widget/comman_widget.dart';

class CallReceiveScreen extends StatefulWidget {
  const CallReceiveScreen({super.key});

  @override
  State<CallReceiveScreen> createState() => _CallReceiveScreenState();
}

class _CallReceiveScreenState extends State<CallReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
             Text(
              'Caller Name',
              style: AppFonts.boldTextStyle(
                fontSize: 30.0,
                color: AppColor.white,
              )
            ),
            const SizedBox(height: 5),
             Text(
              '00:00',
              style: AppFonts.boldTextStyle(
                fontSize: 15.0,
                color: AppColor.white,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCircleButton(Icons.pause, AppColor.white, AppColor.grey,'Pause'),
                buildCircleButton(Icons.volume_up, AppColor.white, AppColor.grey,'Volume'),
                buildCircleButton(Icons.mic_off, AppColor.white, AppColor.grey,'Mute'),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCircleButton(Icons.dialpad, AppColor.white, AppColor.grey,'Keypad'),
                buildCircleButton(Icons.add_call, AppColor.white, AppColor.grey, 'Add call'),
                buildCircleButton(Icons.swap_calls, AppColor.white, AppColor.grey, 'Swap'),
              ],
            ),
            const Spacer(),
            buildCircleButton(Icons.call_end, AppColor.white, AppColor.red,'End call'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}