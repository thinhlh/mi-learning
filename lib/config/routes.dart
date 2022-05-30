import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/pages/article_viewer_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/provider/code_confirmation_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/provider/forgot_password_page_provider.dart';
import 'package:mi_learning/app/my_courses/presentation/pages/my_courses_page.dart';
import 'package:mi_learning/app/my_courses/presentation/providers/my_courses_page_provider.dart';
import 'package:mi_learning/app/saved_course/presentation/pages/saved_courses_page.dart';
import 'package:mi_learning/app/saved_course/presentation/providers/saved_courses_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/schedule_detail_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/timer_chosen_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/schedule_detail_page_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/course_detail_page.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
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
import 'package:mi_learning/app/setting/presentation/pages/change_password_page.dart';
import 'package:mi_learning/app/setting/presentation/pages/setting_page.dart';
import 'package:mi_learning/app/setting/presentation/providers/change_password_page_provider.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_page_provider.dart';
import 'package:mi_learning/app/test/presentation/pages/test_page.dart';
import 'package:mi_learning/app/test/presentation/provider/test_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

class Routes {
  Routes._internal();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static String get initial =>
      FirebaseAuth.instance.currentUser == null ? landing : home;

  static const String landing = '/landing';
  static const String test = '/test';
  static const String about = '/about';
  static const String auth = '/auth';
  static const String signUp = '/sign-up';
  static const String forgotPassword = '/forgot-password';
  static const String codeConfirmation = '/code-confirmation';
  static const String home = '/home';
  static const String courseDetail = '/course-detail';
  static const String lessons = '/lesson';
  static const String explorer = '/explorer';
  static const String noteEditor = '/note-editor';
  static const String setting = '/setting';
  static const String scheduleDetail = '/schedule-detail';
  static const String timerChosen = '/timer-chosen';
  static const String notification = '/notifications';
  static const String orderDetail = '/order-detail';
  static const String payment = '/payment';
  static const String articleViewer = '/article-viewer';
  static const String emailVerification = '/email-verification';
  static const String changePassword = '/profile/chang-password';
  static const String myCourses = '/courses/me';
  static const String savedCourses = '/courses/saved';

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
            provider: (_) => AuthPageProvider(GetIt.I(), GetIt.I()),
            child: const AuthPage(),
          ),
        );

      case Routes.forgotPassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ForgotPasswordPageProvider>(
            provider: (_) => ForgotPasswordPageProvider(GetIt.I()),
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
            provider: (_) => CourseDetailPageProvider(
              GetIt.I(),
              GetIt.I(),
            ),
            child: CourseDetailPage(),
          ),
        );

      case Routes.lessons:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<LessionPageProvider>(
            provider: (_) => LessionPageProvider(GetIt.I()),
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
            provider: (_) => SettingPageProvider(GetIt.I()),
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
            provider: (_) => OrderDetailPageProvider(
              GetIt.I(),
              GetIt.I(),
            ),
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

      case Routes.changePassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ChangePasswordPageProvider>(
            provider: (_) => ChangePasswordPageProvider(GetIt.I()),
            child: ChangePasswordPage(),
          ),
        );

      case Routes.myCourses:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<MyCoursesPageProvider>(
            provider: (_) => MyCoursesPageProvider(),
            child: MyCoursePage(),
          ),
        );

      case Routes.savedCourses:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<SavedCoursesPageProvider>(
            provider: (_) => SavedCoursesPageProvider(GetIt.I()),
            child: SavedCoursesPage(),
          ),
        );
      default:
        return null;
    }
  }
}
