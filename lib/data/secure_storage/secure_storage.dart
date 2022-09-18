import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> read({required String key}) async {
    final result = await _secureStorage.read(key: key);
    return result;
  }
}
