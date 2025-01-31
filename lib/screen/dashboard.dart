import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/controller/theme_controller.dart';
import 'package:lineblocs/screen/profile_screen.dart';
import 'package:lineblocs/screen/setting_screen.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/utils/app_font.dart';
import 'package:sip_ua/sip_ua.dart';
import 'package:sizer/sizer.dart';
import '../controller/dashboard_controller.dart';
import 'call_history_screen.dart';
import 'contact_screen.dart';
import 'dial_pad_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen(this._helper, {Key? key}) : super(key: key);
  final SIPUAHelper? _helper;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController controller = Get.put(DashboardController());
  final ThemeController themeController = Get.put(ThemeController());
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();
    widgetList = [
      DialPadScreen(widget._helper),
      SettingScreen(),
      ContactListScreen(),
      CallHistoryScreen(),
      ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //   backgroundColor: AppColor.white,
        bottomNavigationBar: Container(
          height: 15.w,
          width: double.infinity,
          color:themeController.isDarkMode.value ? null : AppColor.primaryColor,
          child: Obx(()=>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                itemNavigationBar("Home", Icons.home, () {
                  controller.index.value = 0;
                },iconColor: controller.index.value == 0 ? AppColor.white:AppColor.grey),
                itemNavigationBar("Setting", Icons.settings, () {
                  controller.index.value = 1;
                },iconColor: controller.index.value == 1 ? AppColor.white:AppColor.grey),
                itemNavigationBar("Contacts", Icons.group, () {
                  controller.index.value = 2;
                },iconColor: controller.index.value == 2 ? AppColor.white:AppColor.grey),
                itemNavigationBar("Call History", Icons.call, () {
                  controller.index.value = 3;
                },iconColor: controller.index.value == 3 ? AppColor.white:AppColor.grey),
                itemNavigationBar("Profile", Icons.person, () {
                  controller.index.value = 4;
                },iconColor: controller.index.value == 4 ? AppColor.white:AppColor.grey),
              ],
            )
          ),
        ),
        body:  Obx(() => widgetList[controller.index.value]));
  }

  Widget itemNavigationBar(String name, IconData icon, Function() onTap,
      {Color? iconColor, Color? textColor}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: iconColor,),
          SizedBox(
            height: 2.w,
          ),
          Text(
            name,
            style: AppFonts.boldTextStyle(fontSize: 3.w,color: iconColor),
          )
        ],
      ),
    );
  }
}
