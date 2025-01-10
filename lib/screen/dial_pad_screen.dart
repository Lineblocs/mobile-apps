import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../widget/comman_widget.dart';
import 'call_screen.dart';

class DialPadScreen extends StatefulWidget {
  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  final TextEditingController _controller = TextEditingController();

  void _onPressed(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _onCall() {
    Get.to(() => CallScreen());
  }

  void _onRemove() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.w),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                readOnly: true,
                textAlign: TextAlign.center,
                style: AppFonts.boldTextStyle(fontSize: 8.w, color: AppColor.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.5,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  String value;
                  if (index < 9) {
                    value = '${index + 1}';
                  } else if (index == 9) {
                    value = '*';
                  } else if (index == 10) {
                    value = '0';
                  } else {
                    value = '#';
                  }
                  return GestureDetector(
                    onTap: () => _onPressed(value),
                    child: Card(
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _onPressed("+"),
                  child: Card(
                    child: Container(
                      width: 110,
                      height: 70,
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _onRemove,
                  child: Card(
                    child: Container(
                      width: 110,
                      height: 70,
                      child: Center(
                        child: Icon(Icons.backspace, size: 24),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.w),
            InkWell(
              onTap: () {
                _onCall();
              },
              child: buildCircleButton(
                  Icons.call, AppColor.white, AppColor.green, 'Call',
                  textSize: 6.w, iconSize: 12.w, textColor: AppColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
