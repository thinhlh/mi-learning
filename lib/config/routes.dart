import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/course_detail_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/code_confirmation_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/forgot_password_provider.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/home/presentation/providers/home_provider.dart';
import 'package:mi_learning/app/test/presentation/pages/test_page.dart';
import 'package:mi_learning/app/test/presentation/provider/test_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

class Routes {
  Routes._internal();

  static String get initial => home;

  static const String test = '/test';
  static const String about = '/about';
  static const String auth = '/auth';
  static const String forgotPassword = '/forgot_password';
  static const String codeConfirmation = '/code_confirmation';
  static const String home = '/home';
  static const String courseDetail = '/course_detail';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.test:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<TestProvider>(
            provider: (_) => TestProvider(GetIt.I()),
            child: TestPage(),
          ),
        );
      case Routes.about:

      case Routes.auth:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<AuthProvider>(
            provider: (_) => AuthProvider(),
            child: const AuthPage(),
          ),
        );

      case Routes.forgotPassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<ForgotPasswordProvider>(
            provider: (_) => ForgotPasswordProvider(),
            child: const ForgotPasswordPage(),
          ),
        );

      case Routes.codeConfirmation:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<CodeConfirmationProvider>(
            provider: (_) => CodeConfirmationProvider(),
            child: CodeConfirmationPage(),
          ),
        );

      case Routes.home:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<HomeProvider>(
            provider: (_) => HomeProvider(),
            child: HomePage(),
          ),
        );

      case Routes.courseDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<CourseDetailProvider>(
            provider: (_) => CourseDetailProvider(),
            child: CourseDetailPage(),
          ),
        );

      default:
        return null;
    }
  }
}
