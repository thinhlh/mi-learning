import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class LanguageSettingPageProvider extends LoadingProvider {
  bool _isVietnamese = false;

  bool get isVietnamese => _isVietnamese;

  set isVietnamese(bool value) {
    _isVietnamese = value;
    notifyListeners();
  }
}
