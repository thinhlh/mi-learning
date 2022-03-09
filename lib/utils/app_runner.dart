import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mi_learning/app/app.dart';
import 'package:mi_learning/config/languages.dart';
import 'package:mi_learning/core/env/app_config.dart';
import 'package:mi_learning/core/env/env.dart';
import 'package:mi_learning/services/local/local_store.dart';
import 'package:mi_learning/utils/dependency_initializer.dart';

class AppRunner {
  AppRunner._();

  static final AppRunner instance = AppRunner._();

  Future<void> runApplication() async {
    WidgetsFlutterBinding.ensureInitialized();

    AppConfig.initialize(env: Env.dev());

    await Future.wait([
      _initializeDependencies(),
      _appConfigurations(),
      _initServices(),
    ]);

    runApp(const App());
  }

  Future<void> _initializeDependencies() async {
    await EasyLocalization.ensureInitialized();
    await DependencyInitializer.init();
  }

  Future<void> _initServices() async {
    // TODO error handler or logging
    await LocalStore.instance.init();
  }

  Future<void> _appConfigurations() async {
    Intl.defaultLocale = Languages.defaultLocaleString;
  }
}
