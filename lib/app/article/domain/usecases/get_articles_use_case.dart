import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/domain/repositories/article_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetArticlesUseCase extends BaseUseCase<NoParams, List<Article>> {
  final ArticleRepository _articleRepository;

  GetArticlesUseCase(
    this._articleRepository,
  );

  @override
  Future<Either<Failure, List<Article>>> call(NoParams params) {
    return _articleRepository.getArticles();
  }
}
