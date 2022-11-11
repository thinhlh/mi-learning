import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/article/presentation/pages/article_viewer_page.dart';
import 'package:mi_learning/app/article/presentation/providers/article_viewer_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/pages/auth_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/code_confirmation_page.dart';
import 'package:mi_learning/app/auth/presentation/pages/forgot_password_page.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/provider/code_confirmation_page_provider.dart';
import 'package:mi_learning/app/auth/presentation/provider/forgot_password_page_provider.dart';
import 'package:mi_learning/app/categories_detail/presentation/pages/category_detail_page.dart';
import 'package:mi_learning/app/categories_detail/presentation/providers/categories_detail_provider.dart';
import 'package:mi_learning/app/feedback/domain/entities/feedback.dart';
import 'package:mi_learning/app/feedback/presentation/pages/feedback_page.dart';
import 'package:mi_learning/app/feedback/presentation/providers/feedback_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/pages/lesson_page.dart';
import 'package:mi_learning/app/lessons/presentation/pages/note_editor_page.dart';
import 'package:mi_learning/app/lessons/presentation/providers/lesson_page_provider.dart';
import 'package:mi_learning/app/lessons/presentation/providers/note_editor_page_provider.dart';
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
import 'package:mi_learning/app/notification/presentation/pages/notification_page.dart';
import 'package:mi_learning/app/notification/presentation/providers/notification_page_provider.dart';
import 'package:mi_learning/app/order_detail/presentation/pages/order_detail_page.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_page_provider.dart';
import 'package:mi_learning/app/payment/presentation/pages/payment_page.dart';
import 'package:mi_learning/app/payment/presentation/providers/payment_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/schedule_detail_test_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/timer_chosen_page_provider.dart';
import 'package:mi_learning/app/setting/presentation/pages/change_password_page.dart';
import 'package:mi_learning/app/setting/presentation/pages/edit_profile_page.dart';
import 'package:mi_learning/app/setting/presentation/pages/setting_page.dart';
import 'package:mi_learning/app/setting/presentation/providers/change_password_page_provider.dart';
import 'package:mi_learning/app/setting/presentation/providers/edit_profile_page_provider.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_page_provider.dart';
import 'package:mi_learning/app/test/presentation/provider/test_provider.dart';
import 'package:mi_learning/utils/route_util.dart';

import '../app/schedule_detail/presentation/pages/schedule_detail_test_page.dart';
import '../app/test/presentation/pages/test_page.dart';

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
  static const String categories = '/categories';
  static const String feedback = '/feedback';
  static const String editProfile = '/edit-profile';

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
              GetIt.I(),
            ),
            child: CourseDetailPage(),
          ),
        );

      case Routes.lessons:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<LessonPageProvider>(
            provider: (_) => LessonPageProvider(
              GetIt.I(),
              GetIt.I(),
            ),
            child: LessonPage(),
          ),
        );

      case Routes.noteEditor:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<NoteEditorPageProvider>(
            provider: (_) => NoteEditorPageProvider(GetIt.I()),
            child: NoteEditorPage(),
          ),
        );

      case Routes.setting:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<SettingPageProvider>(
            provider: (_) => SettingPageProvider(
              GetIt.I(),
              GetIt.I(),
            ),
            child: SettingPage(),
          ),
        );

      case Routes.editProfile:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<EditProfilePageProvider>(
            provider: (_) => EditProfilePageProvider(GetIt.I()),
            child: EditProfilePage(),
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
      case Routes.quiz:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<ScheduleDetailTestPageProvider>(
            provider: (_) => ScheduleDetailTestPageProvider(),
            child: ScheduleDetailTestPage(),
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

      case Routes.categories:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) =>
              RouteUtil.createPageProvider<CategoryDetailPageProvider>(
            provider: (_) => CategoryDetailPageProvider(GetIt.I()),
            child: CategoryDetailPage(),
          ),
        );

      case Routes.feedback:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          settings: routeSettings,
          builder: (_) => RouteUtil.createPageProvider<FeedbackPageProvider>(
            provider: (_) => FeedbackPageProvider(GetIt.I()),
            child: FeedbackPage(),
          ),
        );
      default:
        return null;
    }
  }
}
