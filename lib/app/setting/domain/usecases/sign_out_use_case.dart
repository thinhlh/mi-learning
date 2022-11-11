import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/base/domain/usecase/base_usecase.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

class SignOutUseCase implements BaseUseCase<NoParams, bool> {
  final SettingRepository _settingRepository;

  SignOutUseCase(this._settingRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _settingRepository.signOut();
  }
}
