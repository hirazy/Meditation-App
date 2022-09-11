import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../provider/api_client_provider.dart';
import '../provider/app_flavor_provider.dart';

enum HttpMethod {
  /// For read request
  get,

  /// For patch request
  patch,

  /// For post request
  post,

  /// For put request
  put,

  /// For delete request
  delete
}

abstract class Repository {
  Repository(
    this.read,
  ) : super();

  /// Read from the change of other providers
  final Reader read;

  /// Host base Url of Server
  String host() => read(appFlavorProvider).apiConfig.baseUrl;

  ApiClient apiClient() => read(apiClientProvider);
}
