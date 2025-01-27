import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/widget/comman_widget.dart';

import '../controller/dashboard_controller.dart';
import '../controller/theme_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import 'call_history_details_screen.dart';

class CallHistoryScreen extends StatefulWidget {

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {

  final ThemeController  themeController = Get.find();
  DashboardController controller = Get.find();
  @override
  void initState() {
    super.initState();
    controller.getCallHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        themeController.isDarkMode.value ? null : AppColor.primaryColor,
        title: Text(
          'Call History',
          style: AppFonts.boldTextStyle(fontSize: 20.0, color: AppColor.white),
        ),
      ),
      body: Stack(
        children: [
          Obx((){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.callHistoryListData.length,
                itemBuilder: (context, index) {
                  var callHistory = controller.callHistoryListData[index];
                  return InkWell(
                    onTap: (){
                      Get.to(CallHistoryDetailsScreen(callHistory:  callHistory,));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          children: [
                            Icon(callHistory.direction  == "outbound" ? Icons.phone_forwarded:callHistory.direction  == "outbound" ? Icons.phone_callback_outlined : Icons.phone_missed, color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor,size: 20,),
                            SizedBox(width: 10,),
                            Text('${callHistory.callFrom}',style: AppFonts.boldTextStyle(fontSize: 18.0, color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor),),
                            Spacer(),
                            Text('${callHistory.durationEndedHuman?? ""}',style: AppFonts.regularTextStyle(fontSize: 16.0, color: themeController.isDarkMode.value
                                ? AppColor.white
                                : AppColor.primaryColor),),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          Obx((){
            return controller.isLoading.value ? commonLoading() : SizedBox();
          }),
        ],
      )
    );
  }
}
