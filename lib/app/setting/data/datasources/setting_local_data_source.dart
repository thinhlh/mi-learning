import 'package:dartz/dartz.dart';
import 'package:mi_learning/config/local_keys.dart';
import 'package:mi_learning/services/local/local_store.dart';

abstract class SettingLocalDataSource {
  Future<bool> clearTokens();
}

class SettingLocalDataSourceImpl implements SettingLocalDataSource {
  @override
  Future<bool> clearTokens() {
    return Future.wait([
      LocalStore.instance.remove(LocalStoreKeys.accessToken),
      LocalStore.instance.remove(LocalStoreKeys.refreshToken),
    ]).then((value) => !value.contains(false));
  }
}
