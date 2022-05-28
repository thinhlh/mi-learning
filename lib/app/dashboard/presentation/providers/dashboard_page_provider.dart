import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class DashboardPageProvider extends LoadingProvider {
  DashboardPageProvider(
    this._getMyCoursesUseCase,
    this._getRecommendedCourseUseCase,
  );

  final GetMyCoursesUseCase _getMyCoursesUseCase;
  final GetRecommendedCourseUseCase _getRecommendedCourseUseCase;

  List<MyCourse>? _myCourses;
  List<RecommendedCourse>? _recommendedCourses;

  List<MyCourse>? get myCourse => _myCourses;

  set myCourses(List<MyCourse> value) {
    _myCourses = value;
    notifyListeners();
  }

  List<RecommendedCourse>? get recommendedCourse => _recommendedCourses;

  set recommendedCourses(List<RecommendedCourse> value) {
    _recommendedCourses = value;
    notifyListeners();
  }

  Future<Either<Failure, List<MyCourse>?>> getMyCourses() async {
    final result = await _getMyCoursesUseCase(NoParams());

    return result.fold((l) => Left(l), (value) {
      myCourses = value;
      return Right(myCourse);
    });
  }

  Future<Either<Failure, List<RecommendedCourse>?>>
      getRecommendedCourses() async {
    final result = await _getRecommendedCourseUseCase(NoParams());

    return result.fold((l) => Left(l), (value) {
      recommendedCourses = value;
      return Right(recommendedCourse);
    });
  }
}
