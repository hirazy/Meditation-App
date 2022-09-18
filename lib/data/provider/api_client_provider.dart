import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../api/api_dio_interceptor.dart';
import 'app_flavor_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  final appFlavor = ref.read(appFlavorProvider);

  final dio = Dio();

  dio.interceptors.add(
    ApiDioInterceptor(
      dio: dio,
      ref: ref,
    ),
  );

  return ApiClient(dio, baseUrl: appFlavor.apiConfig.baseUrl);
});
