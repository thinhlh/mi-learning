import 'package:mi_learning/app/article/domain/usecases/article_injection_container.dart';
import 'package:mi_learning/app/auth/auth_injection_container.dart';
import 'package:mi_learning/app/course_detail/course_detail_injection_container.dart';
import 'package:mi_learning/app/dashboard/dashboard_injection_container.dart';
import 'package:mi_learning/app/schedule/schedule_injection_container.dart';
import 'package:mi_learning/app/test/test_injection_container.dart';

class DependencyInitializer {
  DependencyInitializer._internal();

  static Future<void> init() async {
    await TestInjectionContainer.instance.init();
    await AuthInjectionContainer.instance.init();
    await ArticleInjectionContainer.instance.init();
    await ScheduleInjectionContainer.instance.init();
    await DashboardInjectionContainer.instance.init();
    await CourseDetailInjectionContainer.instance.init();
  }
}
