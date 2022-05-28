import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/data/datasources/article_remote_data_source.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/base/failure.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getArticles();
}
