import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_learning/app/setting/domain/usecases/change_password_use_case.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_profie_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const String changePassword = '/profile/change-password';
  static const String updateUserProfile = '/profile/update';
}

abstract class SettingRemoteDataSource extends BaseApi {
  Future<Either<Failure, bool>> signOut();
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordParams changePasswordParams,
  );
  Future<Either<Failure, BasicUserInfo>> updateUserInfo(
    UpdateUserProfileParams params,
  );
}

class SettingRemoteDataSourceImpl extends SettingRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await _auth.signOut();
      return const Right(true);
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> changePassword(
    ChangePasswordParams changePasswordParams,
  ) async {
    try {
      await _auth.currentUser?.updatePassword(
        changePasswordParams.newPassword,
      );

      final result = await post(
        _Endpoint.changePassword,
        data: changePasswordParams.toMap(),
      );
      return Right(result.data);
    } on FirebaseAuthException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, BasicUserInfo>> updateUserInfo(
    UpdateUserProfileParams params,
  ) async {
    try {
      final result = await post(
        _Endpoint.updateUserProfile,
        data: params.toMap(),
      );
      return Right(BasicUserInfo.fromMap(result.data));
    } on FirebaseAuthException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
