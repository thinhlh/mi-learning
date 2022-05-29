import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/data/datasources/setting_local_data_source.dart';
import 'package:mi_learning/app/setting/data/datasources/setting_remote_data_souce.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingLocalDataSource _settingLocalDataSource;
  final SettingRemoteDataSource _settingRemoteDataSource;

  SettingRepositoryImpl(
    this._settingLocalDataSource,
    this._settingRemoteDataSource,
  );

  @override
  Future<Either<Failure, bool>> signOut() async {
    return (await _settingRemoteDataSource.signOut()).fold(
      (l) => Left(l),
      (r) async {
        return Right(
          await _settingLocalDataSource.clearTokens(),
        );
      },
    );
  }

  @override
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordParams changePasswordParams,
  ) {
    return _settingRemoteDataSource.changePassword(changePasswordParams);
  }
}
