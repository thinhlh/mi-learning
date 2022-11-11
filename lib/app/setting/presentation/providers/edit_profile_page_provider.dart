import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_profie_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/utils/date_time_helper.dart';

class EditProfilePageProvider extends LoadingProvider {
  final UpdateUserProfileUseCase _updateUserProfileUseCase;

  EditProfilePageProvider(this._updateUserProfileUseCase);

  Future<Either<Failure, BasicUserInfo>> updateUserProfile(
    UpdateUserProfileParams params,
  ) async {
    if (params.name?.isEmpty ?? true) {
      return Left(Failure(message: 'Name must not be empty'));
    }

    if (params.occupation?.isEmpty ?? true) {
      return Left(Failure(message: 'Occupation must not be empty'));
    }

    if (DateTime.tryParse(
            params.birthday ?? DateTime.now().toIso8601String()) ==
        null) {
      return Left(Failure(message: 'Date Format is not correct'));
    }

    return _updateUserProfileUseCase(params);
  }
}
