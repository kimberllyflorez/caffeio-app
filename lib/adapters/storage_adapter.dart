import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  bool containsKey(String key);

  Future<bool> setInt(String key, int value);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);

  int? getInt(String key);

  bool? getBool(String key);

  bool getSafeBool(String key);

  double? getDouble(String key);

  String? getString(String key);

  List<String>? getStringList(String key);

  Future<void> remove(String key);

  Future<void> clear();
}

class StorageImpl extends Storage {
  final SharedPreferences _sharedPreferences;

  StorageImpl(this._sharedPreferences);

  @override
  bool containsKey(String key) => _sharedPreferences.containsKey(key);

  @override
  bool? getBool(String key) => _sharedPreferences.getBool(key);

  @override
  bool getSafeBool(String key) => _sharedPreferences.getBool(key) ?? false;

  @override
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  int? getInt(String key) => _sharedPreferences.getInt(key);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  @override
  Future<bool> setBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  @override
  Future<bool> setInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  @override
  Future<bool> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  @override
  Future<void> remove(String key) => _sharedPreferences.remove(key);

  @override
  Future<void> clear() => _sharedPreferences.clear();
}
