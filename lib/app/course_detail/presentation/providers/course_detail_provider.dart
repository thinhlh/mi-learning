import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CourseDetailPageProvider extends LoadingProvider {
  CourseDetailPageProvider(
    this._getCourseDetailUseCase,
    this._toggleSaveCourseUseCase,
  );
  final GetCourseDetailUseCase _getCourseDetailUseCase;
  final ToggleSaveCourseUseCase _toggleSaveCourseUseCase;

  Course? course;

  Future<Either<Failure, Course>> getCourseDetail(String courseId) async {
    final result =
        await _getCourseDetailUseCase(GetCourseDetailParams(courseId));

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (data) {
        course = data;
        notifyListeners();
        return Right(data);
      },
    );
  }

  Future<Either<Failure, bool>> toggleSaveCourse(String courseId) async {
    final result = await _toggleSaveCourseUseCase(
      ToggleSaveCourseParams(
        courseId: courseId,
        saved: !(course?.saved ?? false),
      ),
    );

    return result.fold((l) => Left(l), (value) {
      course = course?.copyWith(saved: value);
      notifyListeners();
      return Right(value);
    });
  }
}
