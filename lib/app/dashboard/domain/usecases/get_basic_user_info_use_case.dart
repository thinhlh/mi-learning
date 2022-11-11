import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/app/user/domain/repositories/user_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class GetBasicUserInfoUseCase implements BaseUseCase<NoParams, BasicUserInfo> {
  final UserRepository _userRepository;

  GetBasicUserInfoUseCase(this._userRepository);

  @override
  Future<Either<Failure, BasicUserInfo>> call(NoParams params) {
    return _userRepository.getBasicUserInfo();
  }
}
