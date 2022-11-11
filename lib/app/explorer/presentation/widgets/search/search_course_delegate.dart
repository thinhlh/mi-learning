import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_categories_use_case.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_small_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/search/category_search_widget.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class SearchCourseDelegate extends SearchDelegate<Course?> {
  final List<Course> courses;

  SearchCourseDelegate({required this.courses});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: AppColors.neutral.shade900,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  String? get searchFieldLabel => 'Search all...';

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.neutral.shade900,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  List<Course> getMatchedCourses() {
    return courses
        .where(
          (course) => course.title.contains(
            query,
          ),
        )
        .toList();
  }

  List<Category> getMatchedCategories(List<Category> categories) {
    return categories
        .where((category) => category.title.contains(query))
        .toList();
  }

  Future<Either<Failure, List<Category>>> get categories =>
      GetCategoriesUseCase(GetIt.I()).call(NoParams());

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          'You could search for anything here.',
          style: context.textTheme.titleLarge,
        ),
      );
    }

    final matchedCourses = getMatchedCourses();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeHeightDimens,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Courses',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: AppStyles.bold,
              ),
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          SizedBox(
            height: 0.25.sh,
            child: matchedCourses.isEmpty
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'No course matched',
                      style: context.textTheme.titleMedium,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => Center(
                      child: CourseSmallWidget(
                        course: matchedCourses[index],
                      ),
                    ),
                    itemCount: matchedCourses.length,
                  ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categories',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: AppStyles.bold,
              ),
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          FutureBuilder<Either<Failure, List<Category>>>(
            future: categories,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Shimmer.fromColors(
                  child: SizedBox(
                    height: 0.25.sh,
                    width: 0.7.sw,
                  ),
                  baseColor: AppColors.baseShimmerColor,
                  highlightColor: AppColors.highlightShimmerColor,
                );
              }

              final List<Category> categories = snapshot.requireData.fold(
                (l) => [],
                (r) => r,
              );

              final filteredCategories = getMatchedCategories(categories);
              return SizedBox(
                height: 0.25.sh,
                child: filteredCategories.isEmpty
                    ? Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'No categories matched',
                          style: context.textTheme.titleMedium,
                        ),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, index) => SizedBox(
                          width: AppDimens.mediumWidthDimens,
                        ),
                        itemBuilder: (_, index) => Center(
                          child: SizedBox(
                            width: 0.5.sw,
                            child: CategorySearch(
                              category: filteredCategories[index],
                            ),
                          ),
                        ),
                        itemCount: filteredCategories.length,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
