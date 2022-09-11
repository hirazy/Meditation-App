import '../data/api/api_config.dart';

enum AppFlavorType { development, production }

class AppFlavor {
  AppFlavor({
    required this.apiConfig,
    required this.appFlavorType,
  });

  ApiConfig apiConfig;
  AppFlavorType appFlavorType;
}

class AppFlavorValue {
  static final development = AppFlavor(
    apiConfig: ApiConfig(
      baseUrl: '',
      masterKey: '',
    ),
    appFlavorType: AppFlavorType.development,
  );

  static final production = AppFlavor(
    apiConfig: ApiConfig(
      baseUrl: '',
      masterKey: '',
    ),
    appFlavorType: AppFlavorType.production,
  );
}
