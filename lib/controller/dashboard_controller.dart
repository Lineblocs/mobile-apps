import 'package:get/get.dart';
import 'package:lineblocs/model/user_model.dart';

import '../service/api_url.dart';
import '../service/base_service.dart';

class DashboardController extends GetxController{
  BaseService baseService = BaseService();
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  RxBool isTFA = false.obs;
  RxString selectedAuthMethod = 'sms'.obs;


  Future<void> getUser() async {
    isLoading.value = true;
    final response = await baseService.get(
      ApiUrl.selfApi,
      isShowMessage: true,
      queryParameters: {
        "issuer": "VISA",
        "last_4": "4242",
        "stripe_id": "",
        "payment_method_id": ""
      },
    );
    if (response.statusCode == 200) {
      print(response.data);
      user.value = UserModel.fromJson(response.data);
      print(user.value.email);
      isLoading.value = false;
    }else{
      baseService.showSuccessMessage(response,"Error", true);
      isLoading.value = false;
    }
  }

}