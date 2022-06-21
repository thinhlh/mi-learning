import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CategorySearch extends StatelessWidget {
  final Category category;
  const CategorySearch({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigator.pushNamed(
        Routes.categories,
        arguments: category,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimens.mediumRadius,
          ),
        ),
        color: AppColors.neutral.shade100,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      AppDimens.mediumRadius,
                    ),
                  ),
                  child: Image.network(
                    category.background,
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimens.mediumHeightDimens,
              ),
              child: Text(
                category.title,
                style: context.textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
