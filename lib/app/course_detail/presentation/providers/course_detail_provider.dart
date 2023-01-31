import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/rating.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/get_course_detail_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/submit_review_use_case.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/toggle_save_course_use_case.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CourseDetailPageProvider extends LoadingProvider {
  CourseDetailPageProvider(
    this._getCourseDetailUseCase,
    this._toggleSaveCourseUseCase,
    this._submitReviewUseCase,
  );

  // Use cases
  final GetCourseDetailUseCase _getCourseDetailUseCase;
  final ToggleSaveCourseUseCase _toggleSaveCourseUseCase;
  final SubmitReviewUseCase _submitReviewUseCase;
  final TextEditingController ratingController = TextEditingController();

  //  Variables

  late Course _course;

  bool purchased = false;

  Course get course => _course;

  set course(Course course) {
    _course = course;
    notifyListeners();
  }

  void setCourseWithOutNotify(Course course) {
    _course = course;
  }

  int _currentRatingStar = 5;

  int get currentRatingStar => _currentRatingStar;

  set currentRatingStar(int value) {
    _currentRatingStar = value;
    notifyListeners();
  }

  Future<Either<Failure, Rating>> submitReviews() {
    return _submitReviewUseCase(
      SubmitReviewParams(
        courseId: course.id,
        content: ratingController.text,
        rating: currentRatingStar,
      ),
    ).then(
      (value) => value.fold(
        (l) => Left(l),
        (r) async {
          final courseDetail =
              await _getCourseDetailUseCase(GetCourseDetailParams(course.id))
                  .then(
            (value) => value.fold(
              (l) => course,
              (r) => r,
            ),
          );

          course = courseDetail;
          return Right(r);
        },
      ),
    );
  }

  Future<Either<Failure, Course>> getCourseDetail() async {
    final result = await _getCourseDetailUseCase(
      GetCourseDetailParams(
        course.id,
      ),
    );

    return result.fold(
      (failure) {
        return Left(failure);
      },
      (data) {
        course = data;
        return Right(data);
      },
    );
  }

  Future<Either<Failure, bool>> toggleSaveCourse() async {
    final result = await _toggleSaveCourseUseCase(
      ToggleSaveCourseParams(
        courseId: course.id,
        saved: !course.saved,
      ),
    );

    return result.fold((l) => Left(l), (value) {
      course = course.copyWith(saved: value);
      notifyListeners();
      return Right(value);
    });
  }
}
