
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/dashboard_controller.dart';
import '../service/show_app_message.dart';
import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../utils/app_string.dart';
import '../widget/comman_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  DashboardController controller = Get.find();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      height: 15.w,
                      width: double.infinity,
                      color: AppColor.primaryColor,
                      child: Center(
                        child: Text(
                          'Setting',
                          style: AppFonts.boldTextStyle(
                              fontSize: 20.0, color: AppColor.white),
                        ),
                      ),
                    ),
                    Obx((){
                      return SwitchListTile(
                        title: Text("Enable Two Factor Authentication"),
                        value: controller.isTFA.value,
                        activeColor: AppColor.primaryColor,
                        inactiveThumbColor: AppColor.grey,
                        hoverColor: AppColor.primaryColor,
                        onChanged: (value) {
                          controller.isTFA.value = value;
                        },
                      );
                    }),
                    Obx((){
                      return  controller.isTFA.value ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text('SMS Verification'),
                              leading: Radio<String>(
                                value: 'sms',
                                activeColor: AppColor.primaryColor,
                                groupValue: controller.selectedAuthMethod.value,
                                onChanged: (String? value) {
                                  setState(() {
                                    controller.selectedAuthMethod.value = value!;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Authentication App'),
                              leading: Radio<String>(
                                value: 'app',
                                activeColor: AppColor.primaryColor,
                                groupValue: controller.selectedAuthMethod.value,
                                onChanged: (String? value) {
                                  setState(() {
                                    controller.selectedAuthMethod.value = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ) : Container();
                    }),
                    Obx((){
                      return controller.isTFA.value ? controller.selectedAuthMethod.value == "sms" ?  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: textFieldWidget(
                            prefixIcon: Icons.phone_iphone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Phone number';
                              }
                              return null;
                            }, labelText: 'Phone Number'),
                      ) : Container(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 4.w),
                            child: Column(
                              children: [
                                Text(AppString().noteStr,style: AppFonts.regularTextStyle(fontSize: 4.w),),
                                SizedBox(height: 4.w,),
                                Text(AppString().scanQR,style: AppFonts.regularTextStyle(fontSize: 4.w),),
                                Icon(Icons.qr_code_2_rounded,size: 60.w,)
                              ],
                            ),
                          )
                      ): Container();
                    }),
                    Obx((){
                      return controller.isTFA.value ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: InkWell(
                          onTap: () {
                            if(controller.selectedAuthMethod.value == "sms") {
                              if (phoneController.text.isEmpty) {
                                showSnackBars(context, 'Please enter phone number',Colors.red);
                              } else {
                              }
                            }else{
                            }
                          },
                          child: Container(
                            height: 12.w,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: AppFonts.boldTextStyle(
                                    fontSize: 5.w, color: AppColor.white),
                              ),
                            ),
                          ),
                        ),
                      ): Container();
                    })
                  ],
                ),
                Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Container()),
              ],
            )));
  }
}
