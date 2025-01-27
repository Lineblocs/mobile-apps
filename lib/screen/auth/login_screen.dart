import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/screen/auth/signup_screen.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/widget/comman_widget.dart';
import 'package:sizer/sizer.dart';

import '../../controller/authentication_controller.dart';
import '../../utils/app_font.dart';
import '../../utils/assets_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationController controller = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20.w),
                  Center(
                    child: SizedBox(
                        height: 100,
                        width: 300,
                        child: Image.asset(AppImages.logo)),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    'Login',
                    style: AppFonts.boldTextStyle(
                        fontSize: 8.w, color: AppColor.primaryColor),
                  ),
                  SizedBox(height: 10.w),
                  Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(children: [
                        textFieldWidget(
                            prefixIcon: Icons.email,
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            }, labelText: 'Email'),
                        SizedBox(height: 3.w),
                        textFieldWidget(
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            // textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            }, labelText: 'Password'),
                      ]),
                    ),
                  ),
                  SizedBox(height: 40.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login(
                              emailController.text, passwordController.text);
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
                            'Login',
                            style: AppFonts.boldTextStyle(
                                fontSize: 5.w, color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.w),
                  // InkWell(
                  //   onTap: () {
                  //     Get.to(() => SignupScreen());
                  //   },
                  //   child: Text(
                  //     'Register here',
                  //     style: AppFonts.regularTextStyle(
                  //         fontSize: 4.w, color: AppColor.primaryColor),
                  //   ),
                  // ),
                ],
              ),
              Obx(() => controller.isLoading.value
                  ? commonLoading()
                  : SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
