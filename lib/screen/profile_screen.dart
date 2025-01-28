import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/auth/login_screen.dart';
import 'package:lineblocs/utils/app_font.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_controller.dart';
import '../controller/theme_controller.dart';
import '../utils/app_colors.dart';
import '../utils/shared_preferences/preferences_manager.dart';
import '../widget/comman_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DashboardController controller = Get.find();
  final ThemeController themeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //       statusBarColor: themeController.isDarkMode.value ? null :
    //       AppColor.primaryColor,
    //       statusBarIconBrightness: Brightness.dark,
    //     )
    // );
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:
                themeController.isDarkMode.value ? null : AppColor.primaryColor,
            title: Text(
              'Profile',
              style:
                  AppFonts.boldTextStyle(fontSize: 20.0, color: AppColor.white),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Obx(() => Expanded(
                            child: Container(
                          child: ListView(children: [
                            ListTile(
                              title: Text('Name',
                                  style: AppFonts.boldTextStyle(
                                    fontSize: 15.0,
                                  )),
                              subtitle: Text(controller.user.value.name ?? "",
                                  style: AppFonts.regularTextStyle(
                                    fontSize: 14.0,
                                  )),
                            ),
                            ListTile(
                                title: Text('Email',
                                    style:
                                        AppFonts.boldTextStyle(fontSize: 15.0)),
                                subtitle:
                                    Text(controller.user.value.email ?? "",
                                        style: AppFonts.regularTextStyle(
                                          fontSize: 14.0,
                                        ))),
                            ListTile(
                                title: Text('Plan',
                                    style: AppFonts.boldTextStyle(
                                      fontSize: 15.0,
                                    )),
                                subtitle: Text(controller.user.value.plan ?? "",
                                    style: AppFonts.regularTextStyle(
                                      fontSize: 14.0,
                                    ))),
                            ListTile(
                                title: Text('Billing package',
                                    style: AppFonts.boldTextStyle(
                                      fontSize: 15.0,
                                    )),
                                subtitle: Text(
                                    controller.user.value.billingPackage ?? "",
                                    style: AppFonts.regularTextStyle(
                                      fontSize: 14.0,
                                    ))),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Logout',
                                            style: AppFonts.boldTextStyle(
                                              fontSize: 15.0,
                                            )),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Are you sure you want to logout?',
                                                style: AppFonts.mediumTextStyle(
                                                  fontSize: 15.0,
                                                  color: AppColor.black,
                                                ))
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel',
                                                  style: AppFonts.boldTextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.red,
                                                  ))),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                PreferencesManager.clear();
                                                Get.offAll(() => LoginScreen());
                                              },
                                              child: Text('Yes',
                                                  style: AppFonts.boldTextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.green,
                                                  ))),
                                        ],
                                      );
                                    });
                              },
                              child: ListTile(
                                  title: Text('Logout',
                                      style: AppFonts.boldTextStyle(
                                        fontSize: 15.0,
                                        color: Colors.red,
                                      ))),
                            ),
                          ]),
                        )))
                  ],
                ),
                Obx(() => controller.isLoading.value
                    ? Center(child: commonLoading())
                    : Container()),
              ],
            ),
          )),
    );
  }
}
