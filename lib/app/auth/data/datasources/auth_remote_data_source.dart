import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_in_request_params.dart';
import 'package:mi_learning/app/auth/domain/usecase/sign_up_request_params.dart';
import 'package:mi_learning/app/common/domain/entity/tokens.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/core/env/app_config.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _EndPoint {
  final String _signInEndPoint = '/login';
  final String _signUpEndPoint = '/register';
}

abstract class AuthRemoteDataSource extends BaseApi with _EndPoint {
  Future<Either<Failure, Tokens>> signIn(SignInRequestParams params);
  Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<Either<Failure, Tokens>> signIn(SignInRequestParams params) async {
    try {
      final result = await post(
        _signInEndPoint,
        host: "http://localhost:8000",
        data: params.toJson(),
      );

      return Right(Tokens.fromMap(result.data));
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signUp(SignUpRequestParams params) async {
    try {
      final result = await post(
        _signUpEndPoint,
        host: "http://localhost:8000",
        data: params.toJson(),
      );

      return Right(result.data);
    } on Object catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
