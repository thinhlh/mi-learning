import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/domain/usecases/get_articles_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/utils/extensions/iterable_extension.dart';

class ArticlePageProvider extends LoadingProvider {
  final GetArticlesUseCase _getArticlesUseCase;

  ArticlePageProvider(this._getArticlesUseCase);

  Future<Either<Failure, Map<String, List<Article>>>> getArticles() {
    return _getArticlesUseCase(NoParams()).then((_) {
      return _.fold(
        (l) => Left(l),
        (value) async {
          final articlesList =
              value.groupBy<String>((article) => article.category);

          _articles = articlesList;
          notifyListeners();

          return Right(_articles);
        },
      );
    });
  }

  Map<String, List<Article>> _articles = {
    // 'Flutter': [],
    // 'Django': [],
    // 'Architecture': [],
    // 'Web3': [],
    // 'Science': [],
    // 'Devs & Life': [],
    // 'Design': [],
  };

  Map<String, List<Article>> get articles => _articles;
}
