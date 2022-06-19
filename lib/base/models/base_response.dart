import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaseResponse extends Equatable {
  final bool success;
  final String? message;
  final dynamic data;

  const BaseResponse._internal(this.success, this.message, this.data);

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse._internal(
      map['success'],
      map['message'],
      map['data'],
    );
  }

  factory BaseResponse.fromJson(String source) {
    return BaseResponse.fromMap(json.decode(source));
  }

  @override
  List<Object?> get props => [success, message, data];
}
