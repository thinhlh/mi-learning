import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/home/presentation/provider/home_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

class Routes {
  Routes._internal();

  static String get initial => auth;

  static const String home = '/home';
  static const String about = '/about';
  static const String auth = '/auth';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<HomeProvider>(
            provider: (_) => HomeProvider(GetIt.I()),
            child: HomePage(),
          ),
        );
      case Routes.about:

      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => RouteUtil.createPageProvider<AuthProvider>(
            provider: (_) => AuthProvider(),
            child: AuthPage(),
          ),
        );

      default:
        return null;
    }
  }
}
