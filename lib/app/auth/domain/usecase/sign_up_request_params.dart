import 'dart:convert';

import 'package:mi_learning/base/domain/usecase/params.dart';

class SignUpRequestParams implements Params {
  String email;
  String password;
  String name;
  String occupation;
  DateTime birthday;
  String? avatar;
  String role;
  SignUpRequestParams({
    required this.email,
    required this.password,
    required this.name,
    required this.occupation,
    required this.birthday,
    this.avatar = "",
    required this.role,
  });

  SignUpRequestParams copyWith({
    String? email,
    String? password,
    String? name,
    String? occupation,
    DateTime? birthday,
    String? avatar,
    String? role,
  }) {
    return SignUpRequestParams(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      occupation: occupation ?? this.occupation,
      birthday: birthday ?? this.birthday,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'occupation': occupation,
      'birthday': birthday.millisecondsSinceEpoch,
      'avatar': avatar,
      'role': role,
    };
  }

  factory SignUpRequestParams.fromMap(Map<String, dynamic> map) {
    return SignUpRequestParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      occupation: map['occupation'] ?? '',
      birthday: DateTime.fromMillisecondsSinceEpoch(map['birthday']),
      avatar: map['avatar'],
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequestParams.fromJson(String source) =>
      SignUpRequestParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpRequestParams(email: $email, password: $password, name: $name, occupation: $occupation, birthday: $birthday, avatar: $avatar, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpRequestParams &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.occupation == occupation &&
        other.birthday == birthday &&
        other.avatar == avatar &&
        other.role == role;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        name.hashCode ^
        occupation.hashCode ^
        birthday.hashCode ^
        avatar.hashCode ^
        role.hashCode;
  }
}
