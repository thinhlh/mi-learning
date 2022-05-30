import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetSavedCoursesUseCase implements BaseUseCase<NoParams, List<Course>> {
  final CourseDetailRepository _courseDetailRepository;

  GetSavedCoursesUseCase(
    this._courseDetailRepository,
  );

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) async {
    return _courseDetailRepository.getSavedCourse();
  }
}
