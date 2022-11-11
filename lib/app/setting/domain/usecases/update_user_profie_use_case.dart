import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class UpdateUserProfileParams implements Params {
  String? name;
  String? avatar;
  String? occupation;
  String? birthday;
  UpdateUserProfileParams({
    this.name,
    this.avatar,
    this.occupation,
    this.birthday,
  });

  UpdateUserProfileParams copyWith({
    String? name,
    String? avatar,
    String? occupation,
    String? birthday,
  }) {
    return UpdateUserProfileParams(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      occupation: occupation ?? this.occupation,
      birthday: birthday ?? this.birthday,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'occupation': occupation,
      'birthday': birthday,
    };
  }

  factory UpdateUserProfileParams.fromMap(Map<String, dynamic> map) {
    return UpdateUserProfileParams(
      name: map['name'],
      avatar: map['avatar'],
      occupation: map['occupation'],
      birthday: map['birthday'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateUserProfileParams.fromJson(String source) =>
      UpdateUserProfileParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UpdateUserProfileParams(name: $name, avatar: $avatar, occupation: $occupation, birthday: $birthday)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UpdateUserProfileParams &&
        other.name == name &&
        other.avatar == avatar &&
        other.occupation == occupation &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        avatar.hashCode ^
        occupation.hashCode ^
        birthday.hashCode;
  }
}

class UpdateUserProfileUseCase
    implements BaseUseCase<UpdateUserProfileParams, BasicUserInfo> {
  final SettingRepository _settingRepository;

  const UpdateUserProfileUseCase(this._settingRepository);

  @override
  Future<Either<Failure, BasicUserInfo>> call(UpdateUserProfileParams params) {
    return _settingRepository.updateUserProfile(params);
  }
}
