import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lineblocs/model/call_history_model.dart';
import 'package:lineblocs/model/user_model.dart';
import 'package:sip_ua/sip_ua.dart';

import '../model/call_recoder_model.dart';
import '../model/sip_credentials_model.dart';
import '../service/api_url.dart';
import '../service/base_service.dart';
import '../service/show_app_message.dart';

class DashboardController extends GetxController{
  BaseService baseService = BaseService();
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  var user = UserModel().obs;
  var sipCredentials = GetSipCredentialsModel().obs;
  var callHistoryListData = <CallHistory>[].obs;
  RxBool isTFA = false.obs;
  RxString selectedAuthMethod = 'sms'.obs;
  final SIPUAHelper helper = SIPUAHelper();

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

  Future<void> getGetSipCredentials(BuildContext context) async {
    isLoading.value = true;
    final response = await baseService.get(
      ApiUrl.getSIPCredentials,
      isShowMessage: true,
    );
    if (response.statusCode == 200) {
      print(response.data);
      sipCredentials.value = GetSipCredentialsModel.fromJson(response.data);
      handleSave(context);
    }else{
      isLoading.value = false;
      baseService.showSuccessMessage(response,"Error", true);
    }
  }
  void handleSave(BuildContext context) {
    if (sipCredentials.value.websocketEndpoint == '') {
      _alert(context, "WebSocket URL");
    } else if (sipCredentials.value.sipUri == '') {
      _alert(context, "SIP URI");
    }
    UaSettings settings = UaSettings();

    settings.port = sipCredentials.value.port;
    settings.webSocketSettings.extraHeaders = {
      'Origin': 'https:// ${Uri.parse(sipCredentials.value.websocketEndpoint?? "").host}',
      'Host': Uri.parse(sipCredentials.value.websocketEndpoint?? "").host
    };
    settings.webSocketSettings.allowBadCertificate = true;
    print('AllowBadCertificate: ${settings.webSocketSettings.allowBadCertificate}');
    settings.webSocketSettings.userAgent = 'Dart/2.8 (dart:io) for OpenSIPS.';
    settings.tcpSocketSettings.allowBadCertificate = true;
    settings.transportType = TransportType.WS;
    print('TransportType: ${settings.transportType}');
    settings.uri = sipCredentials.value.sipUri;
    print('URI: ${settings.uri}');
    settings.webSocketUrl = sipCredentials.value.websocketEndpoint;
    print('WebSocketUrl: ${settings.webSocketUrl}');
    settings.host = sipCredentials.value.host;
    print('Host: ${settings.host}');
    settings.authorizationUser = sipCredentials.value.username;
    print('AuthorizationUser: ${settings.authorizationUser}');
    settings.password = sipCredentials.value.secret;
    print('Password: ${settings.password}');
    settings.displayName = sipCredentials.value.displayName;
    print('DisplayName: ${settings.displayName}');
    settings.userAgent = 'Dart SIP Client v1.0.0';
    print('UserAgent: ${settings.userAgent}');
    settings.dtmfMode = DtmfMode.RFC2833;
    print('DtmfMode: ${settings.dtmfMode}');
    settings.contact_uri = 'sip:${settings.authorizationUser}@${settings.host}';
    print('ContactUri: ${settings.contact_uri}');
    helper.start(settings);
    isLoading.value = false;
  }

  void _alert(BuildContext context, String alertFieldName) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$alertFieldName is empty'),
          content: Text('Please enter $alertFieldName!'),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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