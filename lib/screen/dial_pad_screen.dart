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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/utils/assets_images.dart';
import 'package:sizer/sizer.dart';

import '../controller/theme_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import 'call_screen.dart';

class DialPadScreen extends StatefulWidget {
  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}
//
// class _DialPadScreenState extends State<DialPadScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focusNode = FocusNode(); // Added FocusNode
//   final ThemeController themeController = Get.put(ThemeController());
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.requestFocus(); // Ensure the cursor is displayed
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
//   void _onPressed(String value) {
//     setState(() {
//       _controller.text += value;
//       _focusNode.requestFocus(); // Keep the cursor active
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
//         _focusNode.requestFocus(); // Keep the cursor active
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:
//         themeController.isDarkMode.value ? null : AppColor.primaryColor,
//         centerTitle: true,
//         leading: Icon(
//           Icons.menu,
//           color: themeController.isDarkMode.value ? AppColor.white : Colors.white,
//         ),
//         title: Image.asset(
//           width: 40.w,
//           AppImages.logo, // Path to your image
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
//                 focusNode: _focusNode, // Attach the FocusNode
//                 readOnly: true,
//                 showCursor: true, // Ensure the cursor is displayed
//                 cursorColor: themeController.isDarkMode.value
//                     ? AppColor.white
//                     : AppColor.primaryColor,
//                 textAlign: TextAlign.center,
//                 style: AppFonts.boldTextStyle(
//                   fontSize: 8.w,
//                 ),
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
//                             color: themeController.isDarkMode.value
//                                 ? AppColor.white
//                                 : AppColor.primaryColor,
//                           ),
//                         ),
//                         if (subText != null)
//                           Text(
//                             subText,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: themeController.isDarkMode.value
//                                   ? AppColor.white
//                                   : AppColor.primaryColor,
//                             ),
//                           ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
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
//                       onTap: () {},
//                       child: Icon(
//                         Icons.person,
//                         color: themeController.isDarkMode.value
//                             ? AppColor.white
//                             : AppColor.primaryColor,
//                         size: 14.w,
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
//                             color: themeController.isDarkMode.value
//                                 ? AppColor.white
//                                 : AppColor.primaryColor,
//                             borderRadius: BorderRadius.circular(18),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(
//                               Icons.call,
//                               color: themeController.isDarkMode.value
//                                   ? AppColor.black
//                                   : AppColor.white,
//                               size: 12.w,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: _onRemove,
//                       child: Transform.rotate(
//                         angle: 5.5,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 9.0),
//                           child: Container(
//                             height: 12.w,
//                             width: 12.w,
//                             decoration: BoxDecoration(
//                               color: themeController.isDarkMode.value
//                                   ? AppColor.white
//                                   : AppColor.primaryColor,
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(360),
//                                 bottomLeft: Radius.circular(360),
//                                 bottomRight: Radius.circular(360),
//                               ),
//                             ),
//                             child: Icon(
//                               Icons.add,
//                               color: themeController.isDarkMode.value
//                                   ? AppColor.black
//                                   : AppColor.white,
//                               size: 12.w,
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

class _DialPadScreenState extends State<DialPadScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Added FocusNode
  ThemeController  themeController = Get.find();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus(); // Ensure the cursor is displayed
    _controller.addListener(() {
      // Update state whenever the text changes
      setState(() {});
    });
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

  void _onCall() {
    Get.to(() => CallScreen());
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
        leading: Icon(
          Icons.menu,
          color: themeController.isDarkMode.value ? AppColor.white : Colors.white,
        ),
        title: Image.asset(
          width: 40.w,
          AppImages.logo, // Path to your image
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.w),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode, // Attach the FocusNode
                readOnly: true,
                showCursor: _controller.text.isNotEmpty, // Show cursor only if text exists
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
                    onTap: () => _onPressed(value),
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
            SizedBox(height: 10.w),
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
                        _onCall();
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