// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:lineblocs/utils/assets_images.dart';
// import 'package:sizer/sizer.dart';
//
// import '../controller/theme_controller.dart';
// import '../utils/app_colors.dart';
// import '../utils/app_font.dart';
// import 'call_screen.dart';
//
// class DialPadScreen extends StatefulWidget {
//   @override
//   _DialPadScreenState createState() => _DialPadScreenState();
// }
//
// class _DialPadScreenState extends State<DialPadScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final ThemeController themeController = Get.put(ThemeController());
//
//
//   void _onPressed(String value) {
//     setState(() {
//       _controller.text += value;
//     });
//   }
//
//   void _onCall() {
//     Get.to(() => CallScreen());
//   }
//
//   void _onRemove() {
//     setState(() {
//       if (_controller.text.isNotEmpty) {
//         _controller.text =
//             _controller.text.substring(0, _controller.text.length - 1);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // systemOverlayStyle: SystemUiOverlayStyle(
//         //   statusBarColor: AppColor.primaryColor,
//         //   statusBarIconBrightness: themeController.isDarkMode.value
//         //       ? Brightness.light
//         //       : Brightness.dark,
//         // ),
//         backgroundColor: themeController.isDarkMode.value ? null : AppColor.primaryColor,
//         centerTitle: true,
//         leading: Icon(
//           Icons.menu,
//            color:themeController.isDarkMode.value
//                ? AppColor.white:
//            Colors.white,
//         ),
//         title: Image.asset(
//           width: 40.w,
//           AppImages.logo, // Path to your image
//           // Set desired height
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 10.w),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 controller: _controller,
//                 readOnly: true,
//                 textAlign: TextAlign.center,
//                 style: AppFonts.boldTextStyle(
//                     fontSize: 8.w, ),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             Container(
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 1.5,
//                 ),
//                 itemCount: 12,
//                 itemBuilder: (context, index) {
//                   String value;
//                   String? subText;
//                   if (index < 9) {
//                     value = '${index + 1}';
//                     subText = _getSubText(value);
//                   } else if (index == 9) {
//                     value = '*';
//                   } else if (index == 10) {
//                     value = '0';
//                     subText = '+';
//                   } else {
//                     value = '#';
//                   }
//                   return GestureDetector(
//                     onTap: () => _onPressed(value),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           value,
//                           style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                              color: themeController.isDarkMode.value
//                                  ? AppColor.white:
//                              AppColor.primaryColor,
//                           ),
//                         ),
//                         if (subText != null)
//                           Text(
//                             subText,
//                             style: TextStyle(
//                               fontSize: 14,
//                               // color: Colors.blueGrey,
//                               color: themeController.isDarkMode.value
//                                   ? AppColor.white:
//                               AppColor.primaryColor,
//                             ),
//                           ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     GestureDetector(
//             //       onTap: () => _onPressed("+"),
//             //       child: Card(
//             //         child: Container(
//             //           width: 110,
//             //           height: 70,
//             //           child: Center(
//             //             child: Text(
//             //               "+",
//             //               style: TextStyle(fontSize: 24),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //     GestureDetector(
//             //       onTap: _onRemove,
//             //       child: Card(
//             //         child: Container(
//             //           width: 110,
//             //           height: 70,
//             //           child: Center(
//             //             child: Icon(Icons.backspace, size: 24),
//             //           ),
//             //         ),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             SizedBox(height: 10.w),
//             Container(
//               height: 25.w,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         // _onCall();
//                       },
//                       child: Icon(
//                         Icons.person,
//                         color: themeController.isDarkMode.value
//                             ? AppColor.white:
//                         AppColor.primaryColor,
//                         size: 16.w,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         _onCall();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Container(
//                           height: 20.w,
//                           width: 20.w,
//                           decoration: BoxDecoration(
//                              color: themeController.isDarkMode.value
//                                  ? AppColor.white:
//                              AppColor.primaryColor,
//                             borderRadius: BorderRadius.circular(18),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.call,
//                                color: themeController.isDarkMode.value
//                                    ? AppColor.black:
//                                AppColor.white,
//                               size: 12.w,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         // _onCall();
//                       },
//                       child: InkWell(onTap: () {
//                         _onRemove();
//                       },
//                         child: Transform.rotate(
//                           angle: 5.5,
//                           child: Padding(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: Container(
//                               height: 12.w,
//                               width: 12.w,
//                               decoration: BoxDecoration(
//                                  color: themeController.isDarkMode.value
//                                      ? AppColor.white:
//                                  AppColor.primaryColor,
//                                 borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(360),
//                                     bottomLeft: Radius.circular(360),
//                                     bottomRight: Radius.circular(360)),
//                               ),
//                               child: Icon(
//                                 Icons.add,
//                                  color: themeController.isDarkMode.value
//                                      ? AppColor.black:
//                                  AppColor.white,
//                                 size: 12.w,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// String? _getSubText(String value) {
//   switch (value) {
//     case '1':
//       return '';
//     case '2':
//       return 'ABC';
//     case '3':
//       return 'DEF';
//     case '4':
//       return 'GHI';
//     case '5':
//       return 'JKL';
//     case '6':
//       return 'MNO';
//     case '7':
//       return 'PQRS';
//     case '8':
//       return 'TUV';
//     case '9':
//       return 'WXYZ';
//     default:
//       return null;
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;
import 'package:get/get.dart';
import 'package:lineblocs/utils/assets_images.dart';
import 'package:lineblocs/widget/comman_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proximity_screen_lock/proximity_screen_lock.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_controller.dart';
import '../controller/theme_controller.dart';
import '../service/base_service.dart';
import '../service/show_app_message.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import 'call_screen.dart';
import 'callscreen.dart';

class DialPadScreen extends StatefulWidget {
  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}
class _DialPadScreenState extends State<DialPadScreen>
    implements SipUaHelperListener {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Added FocusNode
  ThemeController themeController = Get.find();
  DashboardController controller = Get.find();

  late RegistrationState _registerState;
  BaseService baseService = BaseService();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    _registerState = controller.helper.registerState;
    _focusNode.requestFocus();
    _controller.addListener(() {
      setState(() {});
    });
    controller.helper.addSipUaHelperListener(this);
    controller.getGetSipCredentials(context);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onPressed(String value) {
    setState(() {
      _controller.text += value;
      _focusNode.requestFocus(); // Keep the cursor active
    });
  }

  void _onRemove() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
        _focusNode.requestFocus(); // Keep the cursor active
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            themeController.isDarkMode.value ? null : AppColor.primaryColor,
        centerTitle: true,
        title: Image.asset(
          width: 40.w,
          AppImages.logo, // Path to your image
        ),
        actions: [
          Obx(()=>  controller.isLoading.value ? Container(): _registerState.state?.name == "REGISTRATION_FAILED" ||
              _registerState.state?.name == "UNREGISTERED" ||
              _registerState.state?.name == "NONE"
              ? Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
              onTap: () {
                controller.getGetSipCredentials(context);
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        'Retry',
                        style: AppFonts.mediumTextStyle(
                            fontSize: 5.w, color: AppColor.primaryColor),
                      ))),
            ),
          )
              : Container(),)
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 2.w),
                Text(
                  controller.user.value.firstName ?? "",
                  style: AppFonts.boldTextStyle(
                    fontSize: 5.w,
                    color: themeController.isDarkMode.value
                        ? AppColor.white
                        : AppColor.primaryColor,
                  ),
                ),
                SizedBox(height: 1.w),
                Obx(()=>  controller.isLoading.value ? Container(): Text(
                  _registerState.state?.name == "REGISTERED"
                      ? "Ready"
                      : _registerState.state?.name == "REGISTRATION_FAILED"
                      ? "Connection failed"
                      : _registerState.state?.name == "NONE"
                      ? "Connection failed"
                      : "Connection failed",
                  style: AppFonts.mediumTextStyle(
                    fontSize: 5.w,
                    color: _registerState.state?.name == "REGISTERED"
                        ? AppColor.green
                        : _registerState.state?.name == "REGISTRATION_FAILED"
                        ? AppColor.red
                        : AppColor.red,
                  ),
                ),),
                SizedBox(height: 3.w),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    readOnly: true,
                    showCursor: _controller.text.isNotEmpty,
                    cursorColor: themeController.isDarkMode.value
                        ? AppColor.white
                        : AppColor.primaryColor,
                    textAlign: TextAlign.center,
                    style: AppFonts.boldTextStyle(
                      fontSize: 8.w,
                    ),
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
                      return InkWell(
                        onTap: () {
                          if (_registerState.state?.name == "REGISTERED") {
                            _onPressed(value);
                          } else {
                            ShowAppMessage.showMessage(
                              "Please retry connection.",
                              true,
                              snackBarType: SnackBarType.error,
                            );
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: themeController.isDarkMode.value
                                    ? AppColor.white
                                    : AppColor.primaryColor,
                              ),
                            ),
                            if (subText != null)
                              Text(
                                subText,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: themeController.isDarkMode.value
                                      ? AppColor.white
                                      : AppColor.primaryColor,
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8.w),
                Container(
                  height: 25.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.person,
                            color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor,
                            size: 16.w,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_registerState.state?.name == "REGISTERED") {
                              _handleCall(context);
                            } else {
                              ShowAppMessage.showMessage(
                                "Please retry connection.",
                                true,
                                snackBarType: SnackBarType.error,
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 20.w,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: themeController.isDarkMode.value
                                    ? AppColor.white
                                    : AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: themeController.isDarkMode.value
                                      ? AppColor.black
                                      : AppColor.white,
                                  size: 12.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: _onRemove,
                          child: Transform.rotate(
                            angle: 5.5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: 12.w,
                                width: 12.w,
                                decoration: BoxDecoration(
                                  color: themeController.isDarkMode.value
                                      ? AppColor.white
                                      : AppColor.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(360),
                                    bottomLeft: Radius.circular(360),
                                    bottomRight: Radius.circular(360),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: themeController.isDarkMode.value
                                      ? AppColor.black
                                      : AppColor.white,
                                  size: 12.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => controller.isLoading.value ? commonLoading() : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  Future<Widget?> _handleCall(BuildContext context,
      [bool voiceOnly = false]) async {
    final dest = _controller.text;
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      await Permission.microphone.request();
      await Permission.camera.request();
    }
    if (dest.isEmpty) {
      ShowAppMessage.showMessage(
        "Please enter number",
        true,
        snackBarType: SnackBarType.error,
      );
      return null;
    }

    var mediaConstraints = <String, dynamic>{
      'audio': true,
      'video': true,
    };

    webrtc.MediaStream mediaStream;

    try {
      mediaStream =
          await webrtc.navigator.mediaDevices.getUserMedia(mediaConstraints);
    } catch (e) {
      print('getUserMedia() failed: $e');
      return null;
    }

    // Add logging to track the call status
    print('Starting call with destination: $dest');
    controller.helper
        .call(dest, voiceOnly: voiceOnly, mediaStream: mediaStream)
        .then((_) {
      print('Call started successfully');
      mediaStream.getAudioTracks().forEach((track) {
        track.onEnded = () {
          print('Audio track ended');
        };
      });
    }).catchError((error) {
      print('Call failed: $error');
    });

    // Ensure the MediaStream is not being closed or garbage collected
    // _keepMediaStreamAlive(mediaStream);
    ProximityScreenLock.setActive(true);
    // _preferences.setString('dest', dest);
    return null;
  }

  void _keepMediaStreamAlive(webrtc.MediaStream mediaStream) {
    // Implement logic to keep the MediaStream alive
    // For example, you can store it in a global variable or a stateful widget

    mediaStream.getAudioTracks().forEach((track) {
      track.onEnded = () {
        print('Audio track ended');
      };
    });
  }

  @override
  void callStateChanged(Call call, CallState state) {
    print('Call state changed to: ${state.state}');
    if (state.state == CallStateEnum.CALL_INITIATION) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreenWidget(controller.helper, call),
        ),
      );
    }
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    // TODO: implement onNewMessage
  }

  @override
  void onNewNotify(Notify ntf) {
    // TODO: implement onNewNotify
  }

  @override
  void onNewReinvite(ReInvite event) {
    // TODO: implement onNewReinvite
  }

  @override
  void registrationStateChanged(RegistrationState state) {
    print('Registration state changed to: ${state.state}');
    setState(() {
      _registerState = state;
    });
  }

  @override
  void transportStateChanged(TransportState state) {
    // TODO: implement transportStateChanged
  }


  @override
  deactivate() {
    super.deactivate();
    // textController.text;
    controller.helper.removeSipUaHelperListener(this);

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
