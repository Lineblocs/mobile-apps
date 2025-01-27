class ApiUrl {
  const ApiUrl._();

  static String baseUrl = 'https://lineblocs.com/api/v1';

  /// -------------------------  Auth -------------------------///

  static String loginApi = '$baseUrl/jwt/authenticate';
  static String selfApi = '$baseUrl/self';
  static String callHistoryApi = '$baseUrl/call/list?extension=';
  static String noteApi = '$baseUrl/call/';
  static String getSIPCredentials = '$baseUrl/getSIPCredentials';
}
