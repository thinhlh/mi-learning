import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class ScheduleDetailPageProvider extends LoadingProvider {
  int _currentChosenTimer = 0;

  int get currentChosenTimer => _currentChosenTimer;

  set currentChosenTimer(int value) {
    _currentChosenTimer = value;
    notifyListeners();
  }
}
