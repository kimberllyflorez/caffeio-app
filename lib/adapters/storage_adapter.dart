import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<void> setString(String key, String value);

  Future<String?> getString(String key);

  Future<void> remove(String key);
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl(this._storage);

  @override
  Future<String?> getString(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> setString(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }
}