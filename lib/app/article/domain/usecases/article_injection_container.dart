import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/data/datasources/article_remote_data_source.dart';
import 'package:mi_learning/app/article/data/repositories/article_repository_impl.dart';
import 'package:mi_learning/app/article/domain/repositories/article_repository.dart';
import 'package:mi_learning/app/article/domain/usecases/get_articles_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class ArticleInjectionContainer extends InjectionContainer {
  ArticleInjectionContainer._internal();

  static final ArticleInjectionContainer instance =
      ArticleInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetArticlesUseCase>(
      () => GetArticlesUseCase(getIt()),
    );

    getIt.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(getIt()),
    );

    getIt.registerLazySingleton<ArticleRemoteDataSource>(
      () => ArticleRemoteDataSourceImpl(),
    );
  }
}
