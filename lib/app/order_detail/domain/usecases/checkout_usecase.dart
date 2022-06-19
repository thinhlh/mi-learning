import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class CheckoutParams implements Params {
  final Course course;

  CheckoutParams({required this.course});
}

class CheckoutUseCase extends BaseUseCase<CheckoutParams, bool> {
  final CourseDetailRepository _courseDetailRepository;

  CheckoutUseCase(this._courseDetailRepository);

  @override
  Future<Either<Failure, bool>> call(CheckoutParams params) {
    return _courseDetailRepository.checkout(params.course.id);
  }
}
