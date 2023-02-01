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

  late DateTime currentChosenBirthday;

  Future<Either<Failure, BasicUserInfo>> updateUserProfile({
    required String name,
    required String occupation,
    required DateTime birthday,
  }) async {
    if (name.isEmpty) {
      return Left(Failure(message: 'Name must not be empty'));
    }

    if (occupation.isEmpty) {
      return Left(Failure(message: 'Occupation must not be empty'));
    }

    if (birthday.difference(DateTime.now()).inDays / 365 >= 12) {
      return Left(Failure(message: 'User must be older than 12'));
    }

    return _updateUserProfileUseCase(
      UpdateUserProfileParams(
        name: name,
        occupation: occupation,
        birthday: currentChosenBirthday,
      ),
    );
  }
}
