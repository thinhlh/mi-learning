import 'package:flutter/material.dart';
import 'package:mi_learning/app/categories_detail/presentation/providers/categories_detail_provider.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_large_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class CategoryDetailPage
    extends PageLoadingStateless<CategoryDetailPageProvider> {
  CategoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
        title: Text(
          context.select<CategoryDetailPageProvider, String>(
            (CategoryDetailPageProvider provider) =>
                provider.category?.title ?? "",
          ),
          style: context.textTheme.titleLarge,
        ),
      ),
      body: Selector<CategoryDetailPageProvider, List<Course>>(
        selector: (_, provider) => provider.courses,
        builder: (_, courses, child) => ListView.separated(
          separatorBuilder: (_, index) =>
              SizedBox(height: AppDimens.extraLargeHeightDimens),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.largeWidthDimens,
            vertical: AppDimens.largeHeightDimens,
          ),
          itemBuilder: (_, index) => CourseLargeWidget(course: courses[index]),
          itemCount: courses.length,
        ),
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) async {
    super.afterFirstBuild(context);

    provider.category = context.getArgument<Category>();

    showLoading(context, true);
    await provider.getCoursesByCategoryId();
    showLoading(context, false);
  }
}
