import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetCourseDetailParams implements Params {
  final String courseId;

  GetCourseDetailParams(this.courseId);
}

class GetCourseDetailUseCase
    implements BaseUseCase<GetCourseDetailParams, Course> {
  final CourseDetailRepository _courseDetailRepository;

  GetCourseDetailUseCase(this._courseDetailRepository);

  @override
  Future<Either<Failure, Course>> call(GetCourseDetailParams params) {
    return _courseDetailRepository.getCourseDetail(params.courseId);
  }
}
