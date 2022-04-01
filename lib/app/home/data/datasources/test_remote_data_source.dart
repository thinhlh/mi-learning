import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/home/data/models/test_connection_model.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _EndPoint {
  final String ping = '/api1';
}

abstract class TestRemoteDataSource extends BaseApi {
  Future<Either<Failure, TestConnectionModel>> checkConnection();
}

class TestRemoteDataSourceImpl extends TestRemoteDataSource with _EndPoint {
  @override
  Future<Either<Failure, TestConnectionModel>> checkConnection() async {
    try {
      final result = await get(ping);

      return Right(TestConnectionModel.fromRawData(result.data));
    } on Exception catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
