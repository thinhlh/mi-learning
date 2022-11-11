import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/usecases/sign_out_use_case.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_avatar_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class SettingPageProvider extends LoadingProvider {
  BasicUserInfo? _userInfo;

  BasicUserInfo? get userInfo => _userInfo;

  set userInfo(BasicUserInfo? userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  final SignOutUseCase _signOutUseCase;
  final UpdateUserAvatarUseCase _updateUserAvatarUseCase;

  SettingPageProvider(
    this._signOutUseCase,
    this._updateUserAvatarUseCase,
  );

  Future<Either<Failure, bool>> signOut() async {
    return _signOutUseCase(NoParams());
  }

  Future<Either<Failure, BasicUserInfo>> updateUserAvatar(
    File file,
    String userId,
  ) async {
    final result = await _updateUserAvatarUseCase(
      UpdateUserAvatarParams(
        file: file,
        fileName: userId,
      ),
    );

    return result.fold(
      (l) => Left(l),
      (newUserInfo) {
        userInfo = newUserInfo;
        return Right(newUserInfo);
      },
    );
  }
}
