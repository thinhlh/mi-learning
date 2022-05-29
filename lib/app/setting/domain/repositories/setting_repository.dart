import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/base/failure.dart';

abstract class SettingRepository {
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordParams changePasswordParams,
  );
}
