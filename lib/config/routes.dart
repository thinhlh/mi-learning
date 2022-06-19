import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/blocs/article_viewer/article_viewer_bloc.dart';
import 'package:mi_learning/app/article/presentation/pages/article_viewer_page.dart';
import 'package:mi_learning/app/auth/presentation/blocs/auth/auth_page_bloc.dart';
import 'package:mi_learning/app/auth/presentation/blocs/code_confirmation/code_confirmation_bloc.dart';
import 'package:mi_learning/app/auth/presentation/blocs/forgot_password/forgot_password_page_bloc.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/course_detail/presentation/bloc/course_detail_page_bloc.dart';
import 'package:mi_learning/app/home/presentation/bloc/home_page_bloc.dart';
import 'package:mi_learning/app/landing/presentation/bloc/landing_page_bloc.dart';
import 'package:mi_learning/app/my_courses/presentation/bloc/my_course_page_bloc.dart';
import 'package:mi_learning/app/my_courses/presentation/pages/my_courses_page.dart';
import 'package:mi_learning/app/notification/presentation/bloc/notification_page_bloc.dart';
import 'package:mi_learning/app/order_detail/presentation/bloc/order_detail_page_bloc.dart';
import 'package:mi_learning/app/payment/presentation/bloc/payment_page_bloc.dart';
import 'package:mi_learning/app/saved_course/presentation/bloc/saved_course_page_bloc.dart';
import 'package:mi_learning/app/saved_course/presentation/pages/saved_courses_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/blocs/schedule_detail_page/schedule_detail_page_bloc.dart';
import 'package:mi_learning/app/schedule_detail/presentation/blocs/schedule_detail_test_page/schedule_detail_test_page_bloc.dart';
import 'package:mi_learning/app/schedule_detail/presentation/blocs/timer_chosen_page/timer_chosen_page_bloc.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/schedule_detail_page.dart';
import 'package:mi_learning/app/schedule_detail/presentation/pages/timer_chosen_page.dart';
import 'package:mi_learning/app/course_detail/presentation/pages/course_detail_page.dart';
import 'package:mi_learning/app/home/presentation/pages/home_page.dart';
import 'package:mi_learning/app/landing/presentation/pages/landing_page.dart';
import 'package:mi_learning/app/lessions/presentation/pages/lession_page.dart';
import 'package:mi_learning/app/lessions/presentation/providers/lession_page_provider.dart';
import 'package:mi_learning/app/notification/presentation/pages/notification_page.dart';
import 'package:mi_learning/app/order_detail/presentation/pages/order_detail_page.dart';
import 'package:mi_learning/app/payment/presentation/pages/payment_page.dart';
import 'package:mi_learning/app/setting/presentation/blocs/change_password_page/change_password_page_bloc.dart';
import 'package:mi_learning/app/setting/presentation/blocs/setting_page/setting_page_bloc.dart';
import 'package:mi_learning/app/setting/presentation/pages/change_password_page.dart';
import 'package:mi_learning/app/setting/presentation/pages/setting_page.dart';
import 'package:mi_learning/utils/route_util.dart';

import '../app/schedule_detail/presentation/pages/schedule_detail_test_page.dart';

class Routes {
  Routes._internal();

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  static String get initial =>
      FirebaseAuth.instance.currentUser == null ? home : home;

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
  static const String quiz = '/schedule-detail/quiz';

  /// This is where you handle routing by name and arguments
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.landing:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<LandingPageBloc>(
            bloc: (_) => LandingPageBloc(),
            child: LandingPage(),
          ),
        );

      // case Routes.test:
      //   return CupertinoPageRoute(
      //     fullscreenDialog: true,
      //     settings: routeSettings,
      //     builder: (_) => RouteUtil.createPageBloc<TestProvider>(
      //       bloc: (_) => TestProvider(GetIt.I()),
      //       child: TestPage(),
      //     ),
      //   );
      // case Routes.about:

      case Routes.auth:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<AuthPageBloc>(
            bloc: (_) => AuthPageBloc(GetIt.I(), GetIt.I()),
            child: const AuthPage(),
          ),
        );

      case Routes.forgotPassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<ForgotPasswordPageBloc>(
            bloc: (_) => ForgotPasswordPageBloc(GetIt.I()),
            child: const ForgotPasswordPage(),
          ),
        );

      case Routes.codeConfirmation:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<CodeConfirmationBloc>(
            bloc: (_) => CodeConfirmationBloc(),
            child: CodeConfirmationPage(),
          ),
        );

      case Routes.home:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<HomePageBloc>(
            bloc: (_) => HomePageBloc(),
            child: HomePage(),
          ),
        );

      case Routes.courseDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<CourseDetailPageBloc>(
            bloc: (_) => CourseDetailPageBloc(
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
          builder: (_) => RouteUtil.createPageBloc<LessionPageProvider>(
            bloc: (_) => LessionPageProvider(GetIt.I()),
            child: LessionPage(),
          ),
        );

      // case Routes.noteEditor:
      //   return CupertinoPageRoute(
      //     fullscreenDialog: true,
      //     settings: routeSettings,
      //     builder: (_) => RouteUtil.createPageProvider<NoteEditorPageProvider>(
      //       provider: (_) => NoteEditorPageProvider(GetIt.I()),
      //       child: NoteEditorPage(QuillController.basic()),
      //     ),
      //   );

      case Routes.setting:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<SettingPageBloc>(
            bloc: (_) => SettingPageBloc(GetIt.I()),
            child: SettingPage(),
          ),
        );

      case Routes.scheduleDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<ScheduleDetailPageBloc>(
            bloc: (_) => ScheduleDetailPageBloc(),
            child: ScheduleDetailPage(),
          ),
        );
      case Routes.quiz:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<ScheduleDetailTestPageBloc>(
            bloc: (_) => ScheduleDetailTestPageBloc(),
            child: ScheduleDetailTestPage(),
          ),
        );

      case Routes.timerChosen:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<TimerChosenPageBloc>(
            bloc: (_) => TimerChosenPageBloc(),
            child: TimerChosenPage(),
          ),
        );

      case Routes.notification:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<NotificationPageBloc>(
            bloc: (_) => NotificationPageBloc(),
            child: NotificationPage(),
          ),
        );

      case Routes.orderDetail:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<OrderDetailPageBloc>(
            bloc: (_) => OrderDetailPageBloc(
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
          builder: (_) => RouteUtil.createPageBloc<PaymentPageBloc>(
            bloc: (_) => PaymentPageBloc(),
            child: PaymentPage(),
          ),
        );

      case Routes.articleViewer:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<ArticleViewerBloc>(
            bloc: (_) => ArticleViewerBloc(),
            child: ArticleViewerPage(),
          ),
        );

      case Routes.changePassword:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<ChangePasswordPageBloc>(
            bloc: (_) => ChangePasswordPageBloc(GetIt.I()),
            child: ChangePasswordPage(),
          ),
        );

      case Routes.myCourses:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<MyCoursePageBloc>(
            bloc: (_) => MyCoursePageBloc(),
            child: MyCoursePage(),
          ),
        );

      case Routes.savedCourses:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageBloc<SavedCoursePageBloc>(
            bloc: (_) => SavedCoursePageBloc(GetIt.I()),
            child: SavedCoursesPage(),
          ),
        );
      default:
        return null;
    }
  }
}
