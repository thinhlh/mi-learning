import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetCourseDetailParam with Params {
  final String courseId;

  GetCourseDetailParam(this.courseId);
}

class GetCourseDetailUseCase
    implements BaseUseCase<GetCourseDetailParam, Course> {
  final CourseDetailRepository repository;

  GetCourseDetailUseCase(this.repository);
  @override
  Future<Either<Failure, Course>> call(GetCourseDetailParam params) {
    return repository.getCourseDetail(params.courseId);
  }
}
