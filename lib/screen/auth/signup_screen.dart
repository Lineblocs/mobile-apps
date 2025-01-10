import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/utils/app_colors.dart';
import 'package:lineblocs/widget/comman_widget.dart';
import 'package:sizer/sizer.dart';

import '../../controller/authentication_controller.dart';
import '../../utils/app_font.dart';
import '../../utils/assets_images.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthenticationController controller = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final phoneController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  Center(
                    child: SizedBox(
                        height: 100,
                        width: 300,
                        child: Image.asset(AppImages.logo)),
                  ),
                  Text(
                    'Register',
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
                            prefixIcon: Icons.person,
                            controller: firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter first name';
                              }
                              return null;
                            }, labelText: 'First Name'),
                        SizedBox(height: 3.w),
                        textFieldWidget(
                            prefixIcon: Icons.person,
                            controller: lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter last name';
                              }
                              return null;
                            }, labelText: 'Last Name'),
                        SizedBox(height: 3.w),
                        textFieldWidget(
                            prefixIcon: Icons.phone_iphone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Phone number';
                              }
                              return null;
                            }, labelText: 'Phone Number'),
                        SizedBox(height: 3.w),
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
                            controller: passwordController,
                            isPassword: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            }, labelText: 'Password'),
                        SizedBox(height: 3.w),
                        textFieldWidget(
                            prefixIcon: Icons.lock,
                            isPassword: true,
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter confirm password';
                              }
                              return null;
                            }, labelText: 'Confirm Password'),
                      ]),
                    ),
                  ),
                  SizedBox(height: 10.w),
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
                            'Sign up',
                            style: AppFonts.boldTextStyle(
                                fontSize: 5.w, color: AppColor.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.w),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Already registered ? Login here',
                      style: AppFonts.regularTextStyle(
                          fontSize: 4.w, color: AppColor.primaryColor),
                    ),
                  ),
                  SizedBox(height: 16.w),
                  Text(
                    'By clicking the button below you agree to our \nToS (Terms Of Service)',
                    textAlign: TextAlign.center,
                    style: AppFonts.mediumTextStyle(
                        fontSize:2.5.w, color: AppColor.black),
                  ),
                  SizedBox(height: 8.w),
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
