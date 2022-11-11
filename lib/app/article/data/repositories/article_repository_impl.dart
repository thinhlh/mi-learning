import 'package:mi_learning/app/article/data/datasources/article_remote_data_source.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/domain/repositories/article_repository.dart';
import 'package:mi_learning/base/failure.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _articleRemoteDataSource;

  ArticleRepositoryImpl(
    this._articleRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Article>>> getArticles() {
    return _articleRemoteDataSource.getArticles();
  }
}
