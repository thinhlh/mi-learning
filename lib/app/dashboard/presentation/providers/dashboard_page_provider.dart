import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class DashboardPageProvider extends LoadingProvider {
  DashboardPageProvider(
    this._getMyCoursesUseCase,
    this._getRecommendedCourseUseCase,
    this._getBasicUserInfoUseCase,
    this._getCourseDetailUseCase,
  );

  final GetBasicUserInfoUseCase _getBasicUserInfoUseCase;
  final GetMyCoursesUseCase _getMyCoursesUseCase;
  final GetRecommendedCourseUseCase _getRecommendedCourseUseCase;
  final GetCourseDetailUseCase _getCourseDetailUseCase;

  BasicUserInfo? userInfo;
  List<Course> _myCourses = [];
  List<Course> _recommendedCourses = [];

  List<Course>? get myCourse => _myCourses;

  set myCourses(List<Course> value) {
    _myCourses = value;
    notifyListeners();
  }

  List<Course> get recommendedCourse => _recommendedCourses;

  set recommendedCourses(List<Course> value) {
    _recommendedCourses = value;
    notifyListeners();
  }

  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo() async {
    final result = await _getBasicUserInfoUseCase(NoParams());

    return result.fold((failure) => Left(failure), (data) {
      userInfo = data;
      notifyListeners();
      return Right(data);
    });
  }

  Future<Either<Failure, List<Course>?>> getMyCourses() async {
    final result = await _getMyCoursesUseCase(NoParams());
    return result.fold((l) => Left(l), (value) {
      myCourses = value;
      return Right(myCourse);
    });
  }

  Future<Either<Failure, List<Course>?>> getRecommendedCourses() async {
    final result = await _getRecommendedCourseUseCase(NoParams());

    return result.fold((l) => Left(l), (value) {
      recommendedCourses = value;
      return Right(recommendedCourse);
    });
  }

  Future<Either<Failure, Course?>> getCourseDetailUseCase(
      String courseId) async {
    final result =
        await _getCourseDetailUseCase(GetCourseDetailParams(courseId));

    return result;
  }
}
