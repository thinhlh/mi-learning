import 'package:mi_learning/app/lessons/data/datasources/lesson_remote_data_source.dart';
import 'package:mi_learning/app/lessons/data/repositories/lesson_repository_impl.dart';
import 'package:mi_learning/app/lessons/domain/repositories/lesson_repository.dart';
import 'package:mi_learning/app/lessons/domain/usecases/create_note_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_finished_status_use_case.dart';
import 'package:mi_learning/app/lessons/domain/usecases/update_lesson_playback_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class LessonInjectionContainer extends InjectionContainer {
  LessonInjectionContainer._internal();

  static final LessonInjectionContainer instance =
      LessonInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<LessonGetCourseDetailUseCase>(
        () => LessonGetCourseDetailUseCase(getIt()));

    getIt.registerLazySingleton<CreateNoteUseCase>(
        () => CreateNoteUseCase(getIt()));

    getIt.registerLazySingleton(() => UpdateLessonFinishedUseCase(getIt()));

    getIt.registerLazySingleton<UpdateLessonPlaybackUseCase>(
        () => UpdateLessonPlaybackUseCase(getIt()));

    getIt.registerLazySingleton<LessonRepository>(
        () => LessonRepositoryImpl(getIt()));

    getIt.registerLazySingleton<LessonRemoteDataSource>(
        () => LessonRemoteDataSourceImpl());
  }
}
