import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Enpoint {
  static const String getArticles = "/articles";
}

abstract class ArticleRemoteDataSource extends BaseApi {
  Future<Either<Failure, List<Article>>> getArticles();
}

class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource {
  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      final result = await get(_Enpoint.getArticles);

      return Right(
        (result.data as List<dynamic>).map((e) => Article.fromMap(e)).toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
