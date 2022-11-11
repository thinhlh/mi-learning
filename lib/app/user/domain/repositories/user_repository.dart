import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo();
}
