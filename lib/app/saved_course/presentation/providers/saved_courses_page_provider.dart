import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/saved_course/domain/get_saved_courses_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class SavedCoursesPageProvider extends LoadingProvider {
  final GetSavedCoursesUseCase _getSavedCoursesUseCase;

  SavedCoursesPageProvider(this._getSavedCoursesUseCase);

  List<Course> savedCourses = [];

  Future<Either<Failure, List<Course>>> getSavedCourses() {
    return _getSavedCoursesUseCase(NoParams()).then(
      (value) => value.fold(
        (l) => Left(l),
        (r) {
          savedCourses = r;
          notifyListeners();
          return Right(r);
        },
      ),
    );
  }
}
