import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_avatar_use_case.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_profie_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/failure.dart';

abstract class SettingRepository {
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordParams changePasswordParams,
  );

  Future<Either<Failure, BasicUserInfo>> updateUserAvatar(
    UpdateUserAvatarParams params,
  );

  Future<Either<Failure, BasicUserInfo>> updateUserProfile(
      UpdateUserProfileParams params);
}
