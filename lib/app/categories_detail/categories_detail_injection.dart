import 'package:mi_learning/app/categories_detail/data/datasources/category_detail_remote_data_source.dart';
import 'package:mi_learning/app/categories_detail/data/repositories/category_detail_repository_impl.dart';
import 'package:mi_learning/app/categories_detail/domain/repositories/category_detail_repository.dart';
import 'package:mi_learning/app/categories_detail/domain/usecases/get_courses_by_category_use_case.dart';
import 'package:mi_learning/base/injection/injection_container.dart';

class CategoryDetailInjection extends InjectionContainer {
  CategoryDetailInjection._internal();

  static final CategoryDetailInjection instance =
      CategoryDetailInjection._internal();

  @override
  Future<void> init() async {
    getIt.registerLazySingleton<GetCoursesByCategoryUseCase>(
      () => GetCoursesByCategoryUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<CategoryDetailRepository>(
      () => CategoryDetailRepositoryImpl(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<CategoryDetailRemoteDataSource>(
      () => CategoryDetailRemoteDataSourceImpl(),
    );
  }
}
