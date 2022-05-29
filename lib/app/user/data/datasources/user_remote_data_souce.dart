import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Endpoint {
  static const basicUserInfo = '/user/me';
}

abstract class UserRemoteDataSource extends BaseApi {
  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo() async {
    try {
      final result = await get(_Endpoint.basicUserInfo);

      return Right(BasicUserInfo.fromMap(result.data));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
