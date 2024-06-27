import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> saveAccessKey(String accessKey) async {
    await _storage.write(key: 'accessKey', value: accessKey);
  }

  Future<void> savePersistentCookie(String cookie) async {
    await _storage.write(key: 'session_cookie', value: cookie);
  }

  Future<String?> getPersistentCookie() async {
    return await _storage.read(key: 'session_cookie');
  }

  Future<String?> getAccessKey() async {
    return await _storage.read(key: 'accessKey');
  }
}
