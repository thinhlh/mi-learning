import 'package:mi_learning/app/saved_course/domain/get_saved_courses_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class SavedCoursesInjectionContainer extends InjectionContainer {
  SavedCoursesInjectionContainer._internal();

  static final SavedCoursesInjectionContainer instance =
      SavedCoursesInjectionContainer._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetSavedCoursesUseCase>(
        () => GetSavedCoursesUseCase(getIt()));
  }
}
