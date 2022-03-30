import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/code_confirmation_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/forgot_password_provider.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/home/presentation/provider/home_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

class Routes {
  Routes._internal();

  static String get initial => auth;

  static const String home = '/home';
  static const String about = '/about';
  static const String auth = '/auth';
  static const String forgotPassword = '/forgot_password';
  static const String codeConfirmation = '/code_confirmation';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<HomeProvider>(
            provider: (_) => HomeProvider(GetIt.I()),
            child: HomePage(),
          ),
        );
      case Routes.about:

      case Routes.auth:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => RouteUtil.createPageProvider<AuthProvider>(
            provider: (_) => AuthProvider(),
            child: const AuthPage(),
          ),
        );

      case Routes.forgotPassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => RouteUtil.createPageProvider<ForgotPasswordProvider>(
            provider: (_) => ForgotPasswordProvider(),
            child: const ForgotPasswordPage(),
          ),
        );

      case Routes.codeConfirmation:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) =>
              RouteUtil.createPageProvider<CodeConfirmationProvider>(
            provider: (_) => CodeConfirmationProvider(),
            child: CodeConfirmationPage(),
          ),
        );

      default:
        return null;
    }
  }
}
