import 'package:mi_learning/app/common/domain/entity/tokens.dart';
import 'package:mi_learning/config/local_keys.dart';
import 'package:mi_learning/services/local/local_store.dart';

abstract class AuthLocalDataSource {
  Future<bool> storeTokens(Tokens tokens);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<bool> storeTokens(Tokens tokens) {
    return Future.wait([
      LocalStore.instance.store(
        LocalStoreKeys.accessToken,
        tokens.accessToken,
      ),
      LocalStore.instance.store(
        LocalStoreKeys.refreshToken,
        tokens.refreshToken,
      )
    ]).then((value) => value.any((element) => element != true));
  }
}
