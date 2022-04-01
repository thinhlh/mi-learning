import 'package:mi_learning/app/home/test_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await TestInjectionContainer.instance.init();
  }
}
