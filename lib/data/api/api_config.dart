class ApiConfig {
  ApiConfig({
    required this.baseUrl,
    required this.masterKey,
  });

  String baseUrl;

  String masterKey;

  String get apiUrl => baseUrl;

  String get bearerToken => masterKey;
}
