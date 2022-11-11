import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class UpdateUserAvatarParams implements Params {
  final File file;
  final String fileName;

  UpdateUserAvatarParams({required this.file, required this.fileName});
}

class UpdateUserAvatarUseCase
    implements BaseUseCase<UpdateUserAvatarParams, BasicUserInfo> {
  final SettingRepository _settingRepository;

  const UpdateUserAvatarUseCase(this._settingRepository);

  @override
  Future<Either<Failure, BasicUserInfo>> call(UpdateUserAvatarParams params) {
    return _settingRepository.updateUserAvatar(params);
  }
}
