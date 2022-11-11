import 'dart:convert';

import 'package:mi_learning/base/domain/usecase/params.dart';

class SignInRequestParams implements Params {
  final String email;
  final String password;

  SignInRequestParams({
    required this.email,
    required this.password,
  });

  SignInRequestParams copyWith({
    String? email,
    String? password,
  }) {
    return SignInRequestParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInRequestParams.fromMap(Map<String, dynamic> map) {
    return SignInRequestParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInRequestParams.fromJson(String source) =>
      SignInRequestParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'SignInRequestParams(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInRequestParams &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
