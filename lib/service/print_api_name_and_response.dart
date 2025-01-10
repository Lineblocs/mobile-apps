import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PrintAPINameAndResponse {
  static printAPINameResponse(
      {required String apiName,
        required String apiUrl,
        required Response response}) {
    if (kDebugMode) {
      if(response.statusCode == 200) {
        print(
            "\x1B[33m---------------########################## Response ################################---------------\x1B[0m");
        print("$apiName Url : $apiUrl");
        print("$apiName API response statusCode : ${response.statusCode}");
        log("$apiName API response : ${response.data.toString()}");
        print(
            "\x1B[33m---------------########################## Response ################################---------------\x1B[0m");
      }
    }
  }
  static printAPIErrorResponse(
      {required String apiUrl,
        required Response response}) {
    if (kDebugMode) {
      print(
          "\x1B[31m---------------########################## Error Response ################################---------------\x1B[0m");
      print("Url : $apiUrl");
      print("API response statusCode : ${response.statusCode}");
      print("API response : ${jsonEncode(response.data)}");
      print(
          "\x1B[31m---------------########################## Error Response ################################---------------\x1B[0m");

    }
  }

  static errorMessageAndRetryPrint({required String message}) {
    if (kDebugMode) {
      print("\x1B[31m---------------*********************** Error & Attempt ***************************************---------------\x1B[0m");
      // print("retry count and error : $message");
      List tempUrl = message.split("[");
      List url = tempUrl[1].split("]");
      print("url : ${url[0]}");
      List messageList = message.split("attempt:");
      print("attempt : ${messageList[1].toString().substring(0, 4)}");
      List error = messageList[1].split("error:");
      print("\x1B[31m error : ${error[1]}\x1B[0m");
      print("\x1B[31m---------------*********************** Error & Attempt ***************************************---------------\x1B[0m");
    }
  }
}