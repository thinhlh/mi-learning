import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class ChangePasswordParams implements Params {
  final String currentPassword;
  final String newPassword;
  ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  ChangePasswordParams copyWith({
    String? currentPassword,
    String? newPassword,
  }) {
    return ChangePasswordParams(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
  }

  factory ChangePasswordParams.fromMap(Map<String, dynamic> map) {
    return ChangePasswordParams(
      currentPassword: map['currentPassword'] ?? '',
      newPassword: map['newPassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordParams.fromJson(String source) =>
      ChangePasswordParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChangePasswordParams(currentPassword: $currentPassword, newPassword: $newPassword)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChangePasswordParams &&
        other.currentPassword == currentPassword &&
        other.newPassword == newPassword;
  }

  @override
  int get hashCode => currentPassword.hashCode ^ newPassword.hashCode;
}

class ChangePasswordUseCase implements BaseUseCase<ChangePasswordParams, bool> {
  final SettingRepository _settingRepository;

  ChangePasswordUseCase(this._settingRepository);

  @override
  Future<Either<Failure, bool>> call(ChangePasswordParams params) {
    return _settingRepository.changePassword(params);
  }
}
