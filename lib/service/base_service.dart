import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lineblocs/service/print_api_name_and_response.dart';
import 'package:lineblocs/service/show_app_message.dart';

import '../utils/shared_preferences/preferences_key.dart';
import '../utils/shared_preferences/preferences_manager.dart';
import 'api_url.dart';

class BaseService {

  Dio getDio() {
    final dio = Dio();
    String? token = PreferencesManager.getString(PreferencesKey.accessToken);
    dio.options = BaseOptions(
      baseUrl: ApiUrl.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer $token",
      },
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
      logPrint: (object) {
        if (kDebugMode) print(object.toString());
      },
    ));
    return dio;
  }

  Future<Response> get(String url, {Map<String, dynamic>? queryParameters, bool isShowMessage = true}) async {
    final dio = getDio();
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioException catch (ex) {
      return _handleError(ex, url, isShowMessage);
    }
  }

  Future<Response> post(String url, {dynamic data, bool isShowMessage = true}) async {
    final dio = getDio();
    try {
      final response = await dio.post(url, data: data);
      return response;
    } on DioException catch (ex) {
      return _handleError(ex, url, isShowMessage);
    }
  }

  Future<Response> put(String url, {dynamic data, bool isShowMessage = true}) async {
    final dio = getDio();
    try {
      final response = await dio.put(url, data: data);
      // showSuccessMessage(response, isShowMessage);
      return response;
    } on DioException catch (ex) {
      return _handleError(ex, url, isShowMessage);
    }
  }

  Future<Response> delete(String url, {dynamic data, bool isShowMessage = true}) async {
    final dio = getDio();
    try {
      final response = await dio.delete(url, data: data);
      // showSuccessMessage(response, isShowMessage);
      return response;
    } on DioException catch (ex) {
      return _handleError(ex, url, isShowMessage);
    }
  }

  void showSuccessMessage(Response response,String message, bool isShowMessage) {
    if (response.statusCode == 200 && isShowMessage) {
      ShowAppMessage.showMessage(
        message,
        isShowMessage,
        snackBarType: SnackBarType.success,
      );
    }
  }

  Response _handleError(DioException ex, String url, bool isShowMessage) {
    if (ex.response != null) {
      PrintAPINameAndResponse.printAPIErrorResponse(apiUrl: url, response: ex.response!);
      if (isShowMessage) {
        ShowAppMessage.showMessage(
          ex.response?.data['exceptionMessage'] ?? 'Error occurred',
          ex.response?.data['status'],
          snackBarType: SnackBarType.error,
        );
      }
      return ex.response!;
    } else {
      if (kDebugMode) {
        String errorMessage = DioExceptionHandler.handleError(ex);
        print('API Request Error: $errorMessage');
      }
      throw Exception("Failed API request: $ex");
    }
  }
}

class DioExceptionHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return 'Request was canceled';
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout';
        case DioExceptionType.sendTimeout:
          return 'Send timeout';
        case DioExceptionType.badResponse:
          return _handleResponseError(error.response?.statusCode);
        case DioExceptionType.badCertificate:
          return 'Bad certificate error';
        case DioExceptionType.connectionError:
          return 'Connection error occurred';
        case DioExceptionType.unknown:
          return 'Unknown error occurred';
      }
    }
    return 'Unexpected error occurred';
  }

  static String _handleResponseError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Received invalid status code: $statusCode';
    }
  }
}
