import 'package:mi_learning/app/user/data/datasources/user_remote_data_souce.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/user/domain/repositories/user_repository.dart';
import 'package:mi_learning/base/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo() {
    return _userRemoteDataSource.getBasicUserInfo();
  }
}
