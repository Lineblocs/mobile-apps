import 'dart:convert';

import 'package:get/get.dart';
import 'package:lineblocs/model/call_history_model.dart';
import 'package:lineblocs/model/user_model.dart';

import '../model/call_recoder_model.dart';
import '../service/api_url.dart';
import '../service/base_service.dart';
import '../service/show_app_message.dart';

class DashboardController extends GetxController{
  BaseService baseService = BaseService();
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  var callHistoryListData = <CallHistory>[].obs;
  RxBool isTFA = false.obs;
  RxString selectedAuthMethod = 'sms'.obs;



  Future<void> getUser() async {
    isLoading.value = true;
    final response = await baseService.getParameters(
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

  Future<void> getCallHistory() async {
    isLoading.value = true;
    final response = await baseService.get(
      "${ApiUrl.callHistoryApi}1000",
      isShowMessage: true,
    );
    if (response.statusCode == 200) {
      print("Call History: ${response.data}");

      CallHistoryModel model = CallHistoryModel.fromJson(response.data);
      print("Call History List: ${model.data?.length}");
      callHistoryListData.value = model.data!;
      isLoading.value = false;
    }else{
      baseService.showSuccessMessage(response,"Error", true);
      isLoading.value = false;
    }
  }

  Future<void> putNote(String id,String note) async {
    isLoading.value = true;
    final response = await baseService.put(
      "${ApiUrl.noteApi}$id",
      isShowMessage: true,
      data: note,
    );
    if (response.statusCode == 204) {
      print("Note updated successfully");
      ShowAppMessage.showMessage(
        "Note updated successfully",
        true,
        snackBarType: SnackBarType.success,
      );
      isLoading.value = false;
    }else{
      baseService.showSuccessMessage(response,"Error", true);
      isLoading.value = false;
    }
  }

  Future<void> getCallRecoder(String id) async {
    isLoading.value = true;
    final response = await baseService.getParameters(
      "${ApiUrl.noteApi}$id",
      isShowMessage: true,
      queryParameters: {
        "issuer": "VISA",
        "last_4": "4242",
        "stripe_id": "",
        "payment_method_id": ""
      }
    );
    if (response.statusCode == 200) {
      print("Call Recoder: ${response.data}");

      CallRecoderModel model = CallRecoderModel.fromJson(response.data);
      // print("Call History List: ${model.data?.length}");
      // callHistoryListData.value = model.data!;
      isLoading.value = false;
    }else{
      baseService.showSuccessMessage(response,"Error", true);
      isLoading.value = false;
    }
  }

}