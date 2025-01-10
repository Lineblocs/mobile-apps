class ApiUrl {
  const ApiUrl._();

  static String baseUrl = 'https://lineblocs.com/api/v1';

  /// -------------------------  Auth -------------------------///

  static String loginApi = baseUrl + '/jwt/authenticate';
  static String selfApi = baseUrl + '/self';
}
