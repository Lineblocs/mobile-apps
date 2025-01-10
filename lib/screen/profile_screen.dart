import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/utils/app_font.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_controller.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DashboardController controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
        body: SafeArea(
          child: Stack(
                  children: [
                    Column(
                      children: [
          Container(
            height: 15.w,
            width: double.infinity,
            color: AppColor.primaryColor,
            child: Center(
              child: Text(
                'Profile',
                style: AppFonts.boldTextStyle(
                    fontSize: 20.0, color: AppColor.white),
              ),
            ),
          ),
          Obx(() => Expanded(
                  child: Container(
                    color: AppColor.white,
                    child: ListView(children: [
                                    ListTile(
                    title: Text('Name',
                        style: AppFonts.boldTextStyle(
                            fontSize: 15.0, color: AppColor.black)),
                    subtitle: Text(controller.user.value.name ?? "",
                        style: AppFonts.regularTextStyle(
                            fontSize: 12.0, color: AppColor.black)),
                                    ),
                                    ListTile(
                      title: Text('Email',
                          style: AppFonts.boldTextStyle(
                              fontSize: 15.0, color: AppColor.black)),
                      subtitle: Text(controller.user.value.email ?? "",
                          style: AppFonts.regularTextStyle(
                              fontSize: 12.0, color: AppColor.black))),
                                    ListTile(
                          title: Text('Plan',
                              style: AppFonts.boldTextStyle(
                                  fontSize: 15.0, color: AppColor.black)),
                          subtitle: Text(controller.user.value.plan ?? "",
                              style: AppFonts.regularTextStyle(
                                  fontSize: 12.0, color: AppColor.black))),
                      ListTile(
                          title: Text('Billing package',
                              style: AppFonts.boldTextStyle(
                                  fontSize: 15.0, color: AppColor.black)),
                          subtitle: Text(controller.user.value.billingPackage ?? "",
                              style: AppFonts.regularTextStyle(
                                  fontSize: 12.0, color: AppColor.black)))
                                  ]),
                  )))
                      ],
                    ),
                    Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container()),
                  ],
                ),
        ));
  }
}
