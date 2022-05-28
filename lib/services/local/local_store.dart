import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  late final SharedPreferences _store;

  LocalStore._internal();

  static final LocalStore instance = LocalStore._internal();

  Future<bool> init() {
    try {
      return SharedPreferences.getInstance()
          .then((value) => _store = value)
          .then((value) => true);
    } catch (e) {
      return Future(() => false);
    }
  }

  T? get<T>(String key, {T? defValue}) {
    try {
      final result = _store.get(key);
      return (result as T);
    } catch (e) {
      return defValue;
    }
  }

  Future<bool> store<T>(String key, T value) {
    if (T is int) {
      return _store.setInt(key, value as int);
    } else if (T is double) {
      return _store.setDouble(key, value as double);
    } else if (T is bool) {
      return _store.setBool(key, value as bool);
    } else if (T is String) {
      return _store.setString(key, value as String);
    } else if (T is List<String>) {
      return _store.setStringList(key, value as List<String>);
    } else {
      return _store.setString(key, value.toString());
    }
  }
}
