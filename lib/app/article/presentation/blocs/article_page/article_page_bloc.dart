import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/domain/usecases/get_articles_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/utils/extensions/iterable_extension.dart';

part 'article_page_event.dart';
part 'article_page_state.dart';

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  final GetArticlesUseCase _getArticlesUseCase;

  ArticlePageBloc(this._getArticlesUseCase) : super(ArticlePageInitialState()) {
    on<ArticlePageLoadArticlesEvent>((event, emit) async {
      emit(ArticlePageLoadingState());
      await _getArticles().then(
        (value) => value.fold(
          (l) => Left(l),
          (articles) => emit(
            ArticlePageLoadedState(articles: articles),
          ),
        ),
      );
    });
  }

  void getArticles() {
    add(ArticlePageLoadArticlesEvent());
  }

  Future<Either<Failure, Map<String, List<Article>>>> _getArticles() async {
    return _getArticlesUseCase(NoParams()).then((_) {
      return _.fold(
        (l) => Left(l),
        (value) async {
          final articlesList = value.groupBy<String>(
            (article) => article.category,
          );
          return Right(articlesList);
        },
      );
    });
  }
}
