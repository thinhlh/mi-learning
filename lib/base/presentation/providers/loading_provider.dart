import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';

abstract class LoadingProvider extends DialogProvider {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // void showLoading(bool show) {
  //   if (isLoading != show) {
  //     _isLoading = show;
  //     notifyListeners();
  //   }
  // }
}
