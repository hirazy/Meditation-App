import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/app_flavor_provider.dart';
import '../provider/secure_storage_provider.dart';

class ApiDioInterceptor extends Interceptor {
  ApiDioInterceptor({
    required this.dio,
    required this.ref,
  });

  Dio dio;
  ProviderRef ref;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final masterKey = ref.read(appFlavorProvider).apiConfig.masterKey;
    final authToken = ref.read(secureStorageProvider).read(key: '');

    super.onRequest(options, handler);
  }
}
