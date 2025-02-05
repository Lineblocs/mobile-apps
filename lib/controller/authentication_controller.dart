
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/login_respones_model.dart';
import '../screen/intro/intro_second_screen.dart';
import '../service/api_url.dart';
import '../service/base_service.dart';
import '../service/show_app_message.dart';
import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';

class AuthenticationController extends GetxController {

  RxBool isLoading = false.obs;

  BaseService baseService = BaseService();

  LoginResponseModel loginResponseModel = LoginResponseModel();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final dio = baseService.getDio();
    try {
      final response = await dio.post(
        ApiUrl.loginApi,
        data: {
          "email":email,
          "password":password,
          "otp":"",
          "challenge":null
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        baseService.showSuccessMessage(response,"Successfully login", true);
        PreferencesManager.setString(PreferencesKey.accessToken, response.data["token"]["auth"]);
        Get.offAll(() => OnboardingScreen());
        isLoading.value = false;
      }else{
        baseService.showSuccessMessage(response,"Error", true);
        isLoading.value = false;
      }
    } on DioException catch (ex) {
      isLoading.value = false;
      ShowAppMessage.showMessage(
        "Invalid email and password",false,
        snackBarType: SnackBarType.error,
      );
    }
  }
}