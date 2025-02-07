import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/controller/theme_controller.dart';
import 'package:lineblocs/model/call_history_model.dart';
import 'package:lineblocs/model/user_model.dart';
import '../model/call_recoder_model.dart';
import '../model/setting_model.dart';
import '../model/sip_credentials_model.dart';
import '../service/api_url.dart';
import '../service/base_service.dart';
import '../service/show_app_message.dart';
import '../utils/app_string.dart';

class DashboardController extends GetxController {
  BaseService baseService = BaseService();
  RxInt index = 0.obs;
  RxString logo = "".obs;
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  var sipCredentials = GetSipCredentialsModel().obs;
  var getSettingModel = SettingModel().obs;
  var callHistoryListData = <CallHistory>[].obs;
  var callHistoryDetails = CallRecordingsModel().obs;
  RxBool isTFA = false.obs;
  RxString selectedAuthMethod = 'sms'.obs;
  final ThemeController themeController = Get.find();

  /// This method is used to update the workspace user like token.
  Future<void> postUpdateWorkspaceUserApi(String fcm, String apn) async {
    isLoading.value = true;
    final response = await baseService.post(
      ApiUrl.updateWorkspaceUserApi,
      isShowMessage: true,
      data: {"fcm_token": fcm, "apn_token": apn},
    );
    if (response.statusCode == 200) {
      print(response.data);
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  /// This method is used to get the user details.
  Future<void> getUser(BuildContext context) async {
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
      themeController.isDarkMode.value =
          user.value.theme == "dark" ? true : false;
      getAllSettingsData(context);
      isLoading.value = false;
    } else {
      baseService.showSuccessMessage(response, "Error", true);
      isLoading.value = false;
    }
  }

  /// This method is used to get the SIP credentials.
  Future<void> getGetSipCredentials(BuildContext context) async {
    isLoading.value = true;
    final response = await baseService.get(
      ApiUrl.getSIPCredentials,
      context,
      isShowMessage: true,
    );
    if (response.statusCode == 200) {
      print(response.data);
      sipCredentials.value = GetSipCredentialsModel.fromJson(response.data);
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  /// This method is used to get all the settings data.
  Future<void> getAllSettingsData(BuildContext context) async {
    final response = await baseService.get(
      ApiUrl.getAllSettings,
      context,
      isShowMessage: true,
    );
    if (response.statusCode == 200) {
      getSettingModel.value = SettingModel.fromJson(response.data);
      if (themeController.isDarkMode.value == false) {
        logo.value =
            "${getSettingModel.value.assetsBaseUrl!}/${getSettingModel.value.customizations!.appLogo!}";
      } else {
        logo.value =
            "${getSettingModel.value.assetsBaseUrl!}/${getSettingModel.value.customizations!.altAppLogo!}";
      }
    } else {
      isLoading.value = false;
    }
  }

  /// This method is used to get the call history.
  Future<void> getCallHistory(BuildContext context) async {
    isLoading.value = true;
    final response = await baseService.get(
      "${ApiUrl.callHistoryApi}1000",
      context,
      isShowMessage: true,
    );
    if (response.statusCode == 200) {
      CallHistoryModel model = CallHistoryModel.fromJson(response.data);
      callHistoryListData.value = model.data!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  /// This method is add the note.
  Future<void> putNote(String id, String note) async {
    isLoading.value = true;
    final response = await baseService.put(
      "${ApiUrl.noteApi}$id",
      isShowMessage: true,
      data: note,
    );
    if (response.statusCode == 204) {
      ShowAppMessage.showMessage(
        AppString().strNoteUpdatedSuccessfully,
        true,
        snackBarType: SnackBarType.success,
      );
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  /// This method is used to get the call recording.
  Future<void> getCallRecording(String id) async {
    isLoading.value = true;
    final response = await baseService.getParameters("${ApiUrl.noteApi}$id",
        isShowMessage: true,
        queryParameters: {
          "issuer": "VISA",
          "last_4": "4242",
          "stripe_id": "",
          "payment_method_id": ""
        });
    if (response.statusCode == 200) {
      CallRecordingsModel model = CallRecordingsModel.fromJson(response.data);
      callHistoryDetails.value = model;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
