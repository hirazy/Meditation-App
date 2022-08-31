import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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