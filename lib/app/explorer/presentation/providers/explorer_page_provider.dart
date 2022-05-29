import 'package:dartz/dartz.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_categories_use_case.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_explorer_courses_use_case.dart';
import 'package:mi_learning/app/explorer/presentation/pages/explorer_page.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

part 'explorer_for_you_page_provider.dart';
part 'explorer_top_chart_page_provider.dart';
part 'explorer_categories_page_provider.dart';
part 'explorer_editor_choice_page_provider.dart';
part 'explorer_premium_page_provider.dart';
part 'explorer_free_page_provider.dart';

class ExplorerPageProvider extends LoadingProvider {
  final GetExplorerCoursesUseCase _getExplorerCoursesUseCase;

  ExplorerPageProvider(this._getExplorerCoursesUseCase);

  List<Course> _courses = [];

  List<Course> get courses => _courses;

  set courses(List<Course> value) {
    _courses = value;
    notifyListeners();
  }

  Future<Either<Failure, List<Course>>> getCourses() async {
    final result = await _getExplorerCoursesUseCase(NoParams());

    return result.fold((failure) => Left(failure), (value) {
      courses = value;
      return Right(value);
    });
  }
}
