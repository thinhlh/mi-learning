import 'package:mi_learning/app/feedback/data/datasources/feedback_remote_data_source.dart';
import 'package:mi_learning/app/feedback/data/repositories/feedback_repository_impl.dart';
import 'package:mi_learning/app/feedback/domain/repositories/feedback_repository.dart';
import 'package:mi_learning/app/feedback/domain/usecases/create_feed_back_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class FeedbackInjectionContainer extends InjectionContainer {
  FeedbackInjectionContainer._internal();
  static FeedbackInjectionContainer instance =
      FeedbackInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<CreateFeedBackUseCase>(
        () => CreateFeedBackUseCase(getIt()));

    getIt.registerLazySingleton<FeedbackRepository>(
        () => FeedbackRepositoryImpl(getIt()));

    getIt.registerLazySingleton<FeedbackRemoteDataSource>(
        () => FeedbackRemoteDataSourceImpl());
  }
}
