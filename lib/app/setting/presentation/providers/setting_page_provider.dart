import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/setting/domain/repositories/setting_repository.dart';
import 'package:mi_learning/app/setting/domain/usecases/sign_out_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class SettingPageProvider extends LoadingProvider {
  final SignOutUseCase _signOutUseCase;

  SettingPageProvider(
    this._signOutUseCase,
  );

  Future<Either<Failure, bool>> signOut() async {
    return _signOutUseCase(NoParams());
  }
}
