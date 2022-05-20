import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/pages/article_viewer_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/schedule_detail_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/timer_chosen_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/schedule_detail_page_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/course_detail_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/code_confirmation_page_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/forgot_password_page_provider.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/home/presentation/providers/home_page_provider.dart';
import 'package:mi_learning/app/landing/presentation/pages/landing_page.dart';
import 'package:mi_learning/app/landing/presentation/providers/landing_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/pages/note_editor_page.dart';
import 'package:mi_learning/app/lessions/presentation/pages/lession_page.dart';
import 'package:mi_learning/app/lessions/presentation/providers/note_editor_page_provider.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_page_provider.dart';
import 'package:mi_learning/app/notification/presentation/pages/notification_page.dart';
import 'package:mi_learning/app/notification/presentation/providers/notification_page_provider.dart';
import 'package:mi_learning/app/order_detail/presentation/pages/order_detail_page.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_page_provider.dart';
import 'package:mi_learning/app/payment/presentation/pages/payment_page.dart';
import 'package:mi_learning/app/payment/presentation/providers/payment_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/timer_chosen_page_provider.dart';
import 'package:mi_learning/app/setting/presentation/pages/setting_page.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_page_provider.dart';
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
          builder: (_) => RouteUtil.createPageProvider<LandingPageProvider>(
            provider: (_) => LandingPageProvider(),
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
          builder: (_) => RouteUtil.createPageProvider<AuthPageProvider>(
            provider: (_) => AuthPageProvider(),
            child: const AuthPage(),
          ),
        );

      case Routes.forgotPassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ForgotPasswordPageProvider>(
            provider: (_) => ForgotPasswordPageProvider(),
            child: const ForgotPasswordPage(),
          ),
        );

      case Routes.codeConfirmation:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<CodeConfirmationPageProvider>(
            provider: (_) => CodeConfirmationPageProvider(),
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
          builder: (_) =>
              RouteUtil.createPageProvider<CourseDetailPageProvider>(
            provider: (_) => CourseDetailPageProvider(),
            child: CourseDetailPage(),
          ),
        );

      case Routes.lession:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<LessionPageProvider>(
            provider: (_) => LessionPageProvider(),
            child: LessionPage(),
          ),
        );

      case Routes.noteEditor:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<NoteEditorPageProvider>(
            provider: (_) => NoteEditorPageProvider(),
            child: NoteEditorPage(QuillController.basic()),
          ),
        );

      case Routes.setting:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<SettingPageProvider>(
            provider: (_) => SettingPageProvider(),
            child: SettingPage(),
          ),
        );

      case Routes.scheduleDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ScheduleDetailPageProvider>(
            provider: (_) => ScheduleDetailPageProvider(),
            child: ScheduleDetailPage(),
          ),
        );

      case Routes.timerChosen:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<TimerChosenPageProvider>(
            provider: (_) => TimerChosenPageProvider(),
            child: TimerChosenPage(),
          ),
        );

      case Routes.notification:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<NotificationPageProvider>(
            provider: (_) => NotificationPageProvider(),
            child: NotificationPage(),
          ),
        );

      case Routes.orderDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<OrderDetailPageProvider>(
            provider: (_) => OrderDetailPageProvider(),
            child: OrderDetailPage(),
          ),
        );

      case Routes.payment:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<PaymentPageProvider>(
            provider: (_) => PaymentPageProvider(),
            child: PaymentPage(),
          ),
        );

      case Routes.articleViewer:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ArticleViewerPageProvider>(
            provider: (_) => ArticleViewerPageProvider(),
            child: ArticleViewerPage(),
          ),
        );
      default:
        return null;
    }
  }
}
