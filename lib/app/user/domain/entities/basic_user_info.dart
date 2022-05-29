import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mi_learning/utils/date_time_helper.dart';

class BasicUserInfo {
  final String id;
  final String name;
  final String email;
  final String occupation;
  final DateTime birthday;
  final String? avatar;
  final bool enabled = false;
  final String role;

  BasicUserInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.occupation,
    required this.birthday,
    this.avatar,
    required this.role,
  });

  BasicUserInfo copyWith({
    String? id,
    String? name,
    String? email,
    String? occupation,
    DateTime? birthday,
    String? avatar,
    String? role,
  }) {
    return BasicUserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      occupation: occupation ?? this.occupation,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'occupation': occupation,
      'birthday': birthday.millisecondsSinceEpoch,
      'avatar': avatar,
      'role': role,
    };
  }

  factory BasicUserInfo.fromMap(Map<String, dynamic> map) {
    return BasicUserInfo(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      occupation: map['occupation'] ?? '',
      birthday: DateTimeHelper.dateTimeFromServerDateTimeResponse(
          (map['birthday'] as List<dynamic>).cast<int>()),
      avatar: map['avatar'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicUserInfo.fromJson(String source) =>
      BasicUserInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BasicUserInfo(id: $id, name: $name, email: $email, occupation: $occupation, birthday: $birthday, avatar: $avatar, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicUserInfo &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.occupation == occupation &&
        other.birthday == birthday &&
        other.avatar == avatar &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        occupation.hashCode ^
        birthday.hashCode ^
        avatar.hashCode ^
        role.hashCode;
  }
}
