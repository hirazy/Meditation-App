import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../service/audio_service.dart';
import '../api/api_client.dart';
import '../provider/api_client_provider.dart';
import '../provider/app_flavor_provider.dart';
import '../provider/secure_storage_provider.dart';
import '../secure_storage/secure_storage.dart';

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

  /// Api client
  ApiClient apiClient() => read(apiClientProvider);

  /// Secure Storage
  SecureStorage secureStorage() => read(secureStorageProvider);

  /// Audio Player
  AudioServiceImpl get audioServiceImpl => GetIt.instance<AudioServiceImpl>();

  bool isOk(final int statusCode) =>
      statusCode == HttpStatus.ok ||
      statusCode == HttpStatus.created ||
      statusCode == HttpStatus.accepted;

  bool isDataError(final int statusCode) => statusCode.toString()[0] == '4';

  bool isServerError(final int statusCode) => statusCode.toString()[0] == '5';
}
