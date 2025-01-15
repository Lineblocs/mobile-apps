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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Image.asset(
          width: 40.w,
          'assets/images/logo.png', // Path to your image
          // Set desired height
        ),
      ),
      // backgroundColor: AppColor.primaryColor,
      backgroundColor: AppColor.white,
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
                style: AppFonts.boldTextStyle(
                    fontSize: 8.w, color: AppColor.white),
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
                  String? subText;
                  if (index < 9) {
                    value = '${index + 1}';
                    subText = _getSubText(value);
                  } else if (index == 9) {
                    value = '*';
                  } else if (index == 10) {
                    value = '0';
                    subText = '+';
                  } else {
                    value = '#';
                  }
                  return GestureDetector(
                    onTap: () => _onPressed(value),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        if (subText != null)
                          Text(
                            subText,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     GestureDetector(
            //       onTap: () => _onPressed("+"),
            //       child: Card(
            //         child: Container(
            //           width: 110,
            //           height: 70,
            //           child: Center(
            //             child: Text(
            //               "+",
            //               style: TextStyle(fontSize: 24),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: _onRemove,
            //       child: Card(
            //         child: Container(
            //           width: 110,
            //           height: 70,
            //           child: Center(
            //             child: Icon(Icons.backspace, size: 24),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 15.w),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: buildCircleButton(
                        Icons.person, AppColor.primaryColor, AppColor.white, '',
                        textSize: 6.w, iconSize: 12.w, textColor: AppColor.white),
                  ),
                  InkWell(
                    onTap: () {
                      _onCall();
                    },
                    child: buildCircleButton(
                        borderRadius: BorderRadius.circular(18),
                        Icons.call,
                        AppColor.white,
                        AppColor.primaryColor,
                        '',
                        textSize: 6.w,
                        iconSize: 12.w,
                        textColor: AppColor.white),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Transform.rotate(
                      angle: 5.5,
                      child: buildCircleButton(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(360),
                              bottomLeft: Radius.circular(360),
                              bottomRight: Radius.circular(360)),
                          Icons.add,
                          AppColor.white,
                          AppColor.primaryColor,
                          '',
                          textSize: 6.w,
                          iconSize: 9.w,
                          textColor: AppColor.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? _getSubText(String value) {
  switch (value) {
    case '1':
      return '';
    case '2':
      return 'ABC';
    case '3':
      return 'DEF';
    case '4':
      return 'GHI';
    case '5':
      return 'JKL';
    case '6':
      return 'MNO';
    case '7':
      return 'PQRS';
    case '8':
      return 'TUV';
    case '9':
      return 'WXYZ';
    default:
      return null;
  }
}
