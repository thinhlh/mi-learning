import 'package:mi_learning/core/env/app_config.dart';
import 'package:mi_learning/core/env/env.dart';
import 'package:mi_learning/utils/app_runner.dart';

void main() async {
  AppConfig.initialize(env: Env.dev());

  AppRunner.instance.runApplication();
}
