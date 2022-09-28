import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/alert_dialog_provider.dart';
import '../provider/app_flavor_provider.dart';
import '../provider/secure_storage_provider.dart';
import 'api_paths.dart';

class ApiDioInterceptor extends Interceptor {
  ApiDioInterceptor({
    required this.dio,
    required this.ref,
  });

  Dio dio;
  ProviderRef ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final masterKey = ref.read(appFlavorProvider).apiConfig.masterKey;
    final authToken = await ref.read(secureStorageProvider).read(key: '');
    const authorizationTerm = 'Authorization';

    switch (options.path) {
      case ApiPaths.userTerm:
        options.headers[authorizationTerm] = 'Bearer $masterKey';
        break;
      case ApiPaths.personalizeTerm:
        options.headers[authorizationTerm] = 'Bearer $authToken';
        break;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.response) {
      await handleShowDialog(err);
    }
  }

  Future<void> handleShowDialog(DioError err) async {
    await FirebaseCrashlytics.instance.recordError(err, null);
  }

  Future<void> showServerErrorDialog() async {
    await ref.read(alertDialogProvider).showAlertDialog(
          title: '',
          message: '',
        );
  }
}
