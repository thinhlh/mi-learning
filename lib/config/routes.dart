import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/pages/article_viewer_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_provider.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/app/calendar/presentation/pages/schedule_detail_page.dart';
import 'package:mi_learning/app/calendar/presentation/pages/timer_chosen_page.dart';
import 'package:mi_learning/app/calendar/presentation/providers/schedule_detail_provider.dart';
import 'package:mi_learning/app/calendar/presentation/providers/timer_chosen_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/course_detail_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/code_confirmation_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/forgot_password_provider.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/home/presentation/providers/home_provider.dart';
import 'package:mi_learning/app/landing/presentation/pages/landing_page.dart';
import 'package:mi_learning/app/landing/presentation/providers/landing_provider.dart';
import 'package:mi_learning/app/lessions/presentation/pages/note_editor_page.dart';
import 'package:mi_learning/app/lessions/presentation/pages/lession_page.dart';
import 'package:mi_learning/app/lessions/presentation/providers/note_editor_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_provider.dart';
import 'package:mi_learning/app/notification/presentation/pages/notification_page.dart';
import 'package:mi_learning/app/notification/presentation/providers/notification_provider.dart';
import 'package:mi_learning/app/order_detail/presentation/pages/order_detail_page.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_provider.dart';
import 'package:mi_learning/app/payment/presentation/pages/payment_page.dart';
import 'package:mi_learning/app/payment/presentation/providers/payment_provider.dart';
import 'package:mi_learning/app/setting/presentation/pages/setting_page.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_provider.dart';
import 'package:mi_learning/app/test/presentation/pages/test_page.dart';
import 'package:mi_learning/app/test/presentation/provider/test_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

class Routes {
  Routes._internal();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static String get initial => landing;

  static const String landing = '/landing';
  static const String test = '/test';
  static const String about = '/about';
  static const String auth = '/auth';
  static const String forgotPassword = '/forgot_password';
  static const String codeConfirmation = '/code_confirmation';
  static const String home = '/home';
  static const String courseDetail = '/course_detail';
  static const String lession = '/lession';
  static const String explorer = '/explorer';
  static const String noteEditor = '/note_editor';
  static const String setting = '/setting';
  static const String scheduleDetail = '/schedule_detail';
  static const String timerChosen = '/timer_chosen';
  static const String notification = '/notifications';
  static const String orderDetail = '/order_detail';
  static const String payment = '/payment';
  static const String articleViewer = '/article_viewer';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.landing:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<LandingProvider>(
            provider: (_) => LandingProvider(),
            child: LandingPage(),
          ),
        );

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

      case Routes.lession:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<LessionProvider>(
            provider: (_) => LessionProvider(),
            child: LessionPage(),
          ),
        );

      case Routes.noteEditor:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<NoteEditorProvider>(
            provider: (_) => NoteEditorProvider(),
            child: NoteEditorPage(QuillController.basic()),
          ),
        );

      case Routes.setting:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<SettingProvider>(
            provider: (_) => SettingProvider(),
            child: SettingPage(),
          ),
        );

      case Routes.scheduleDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<ScheduleDetailProvider>(
            provider: (_) => ScheduleDetailProvider(),
            child: ScheduleDetailPage(),
          ),
        );

      case Routes.timerChosen:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<TimerChosenProvider>(
            provider: (_) => TimerChosenProvider(),
            child: TimerChosenPage(),
          ),
        );

      case Routes.notification:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<NotificationProvider>(
            provider: (_) => NotificationProvider(),
            child: NotificationPage(),
          ),
        );

      case Routes.orderDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<OrderDetailProvider>(
            provider: (_) => OrderDetailProvider(),
            child: OrderDetailPage(),
          ),
        );

      case Routes.payment:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<PaymentProvider>(
            provider: (_) => PaymentProvider(),
            child: PaymentPage(),
          ),
        );

      case Routes.articleViewer:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<ArticleViewerProvider>(
            provider: (_) => ArticleViewerProvider(),
            child: ArticleViewerPage(),
          ),
        );
      default:
        return null;
    }
  }
}
