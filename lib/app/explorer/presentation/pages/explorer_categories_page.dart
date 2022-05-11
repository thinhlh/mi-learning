import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_categories_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ExplorerCategoriesPage
    extends PageLoadingStateless<ExplorerCategoriesProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeHeightDimens,
      ),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimens.largeWidthDimens,
        childAspectRatio: 1 / 1.3,
        mainAxisSpacing: AppDimens.smallHeightDimens,
      ),
      itemBuilder: (_, index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimens.largeRadius,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                'assets/images/flutter-course.jpeg',
                isAntiAlias: true,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            'Development',
            style: context.textTheme.titleLarge,
          )
        ],
      ),
      itemCount: 10,
    );
  }

  @override
  void initialization(BuildContext context) {}
}
