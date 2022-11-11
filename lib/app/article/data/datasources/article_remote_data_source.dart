import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/services/rest_api/models/base_api.dart';

mixin _Enpoint {
  final String getArticlesEndPoint = "/articles";
}

abstract class ArticleRemoteDataSource extends BaseApi with _Enpoint {
  Future<Either<Failure, List<Article>>> getArticles();
}

class ArticleRemoteDataSourceImpl extends ArticleRemoteDataSource {
  @override
  Future<Either<Failure, List<Article>>> getArticles() async {
    try {
      final result = await get(getArticlesEndPoint);

      return Right(
        (result.data as List<dynamic>).map((e) => Article.fromMap(e)).toList(),
      );
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
