import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/categories_detail/domain/usecases/get_courses_by_category_use_case.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class CategoryDetailPageProvider extends LoadingProvider {
  final GetCoursesByCategoryUseCase _getCoursesByCategoryUseCase;

  CategoryDetailPageProvider(this._getCoursesByCategoryUseCase);

  Category? category;

  List<Course> _courses = [];
  List<Course> get courses => _courses;
  set courses(List<Course> courses) {
    _courses = courses;
    notifyListeners();
  }

  Future<Either<Failure, List<Course>>> getCoursesByCategoryId() async {
    return _getCoursesByCategoryUseCase(
      GetCoursesByCategoryUseCaseParams(
        categoryId: category?.id ?? "",
      ),
    ).then(
      (value) => value.fold(
        (l) => Left(l),
        (r) {
          courses = r;
          return Right(r);
        },
      ),
    );
  }
}
