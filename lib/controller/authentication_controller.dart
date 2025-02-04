
import 'package:get/get.dart';

import '../model/login_respones_model.dart';
import '../screen/intro/intro_second_screen.dart';
import '../service/api_url.dart';
import '../service/base_service.dart';
import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';

class AuthenticationController extends GetxController {

  RxBool isLoading = false.obs;

  BaseService baseService = BaseService();

  LoginResponseModel loginResponseModel = LoginResponseModel();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    final response = await baseService.post(
      ApiUrl.loginApi,
      isShowMessage: true,
      data: {
        "email":email,
        "password":password,
        "otp":"",
        "challenge":null
      },
    );
    print("response.statusCode ${response.statusCode}");
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
  }

}