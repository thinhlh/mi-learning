import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/course_detail/domain/repositories/course_detail_repository.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class OrderDetailPageProvider extends LoadingProvider {
  int? paymentResult;
  final GetBasicUserInfoUseCase _getBasicUserInfoUseCase;

  BasicUserInfo? userInfo;

  final CourseDetailRepository _courseDetailRepository;
  OrderDetailPageProvider(
    this._getBasicUserInfoUseCase,
    this._courseDetailRepository,
  );
  Future<Either<Failure, BasicUserInfo>> getBasicUserInfo() async {
    final result = await _getBasicUserInfoUseCase(NoParams());

    return result.fold((failure) => Left(failure), (data) {
      userInfo = data;
      notifyListeners();
      return Right(data);
    });
  }

  Future<Either<Failure, bool>> checkout(Course course) {
    return _courseDetailRepository.checkout(course.id);
  }
}
