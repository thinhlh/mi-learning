import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class CheckoutParam implements Params {
  final String courseId;

  CheckoutParam(this.courseId);
}

class CheckoutUseCase extends BaseUseCase<CheckoutParam, bool> {
  final CourseDetailRepository _repository;
  CheckoutUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(CheckoutParam param) {
    return _repository.checkout(param.courseId);
  }
}
