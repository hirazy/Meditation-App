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
      baseUrl: 'http://192.168.53.107:9000/',
      masterKey: 'EfDeaiRE0aXCqmwcGhENzUnadldu4bY9',
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
