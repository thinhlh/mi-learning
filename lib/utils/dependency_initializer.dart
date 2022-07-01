import 'package:mi_learning/app/article/domain/usecases/article_injection_container.dart';
import 'package:mi_learning/app/auth/auth_injection_container.dart';
import 'package:mi_learning/app/categories_detail/categories_detail_injection.dart';
import 'package:mi_learning/app/course_detail/course_detail_injection_container.dart';
import 'package:mi_learning/app/dashboard/dashboard_injection_container.dart';
import 'package:mi_learning/app/explorer/explorer_injection_container.dart';
import 'package:mi_learning/app/feedback/feedback_injection_container.dart';
import 'package:mi_learning/app/lessons/lesson_injection_container.dart';
import 'package:mi_learning/app/saved_course/saved_courses_injection_container.dart';
import 'package:mi_learning/app/schedule/schedule_injection_container.dart';
import 'package:mi_learning/app/setting/setting_injection_container.dart';
import 'package:mi_learning/app/test/test_injection_container.dart';
import 'package:mi_learning/app/user/user_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await ArticleInjectionContainer.instance.init();
    await AuthInjectionContainer.instance.init();
    await CourseDetailInjectionContainer.instance.init();
    await DashboardInjectionContainer.instance.init();
    await ScheduleInjectionContainer.instance.init();
    await SettingInjectionContainer.instance.init();
    await TestInjectionContainer.instance.init();
    await UserInjectionContainer.instance.init();
    await ExplorerInjectionContainer.instance.init();
    await LessonInjectionContainer.instance.init();
    await SavedCoursesInjectionContainer.instance.init();
    await CategoryDetailInjection.instance.init();
    await FeedbackInjectionContainer.instance.init();
  }
}
