import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseCategoryWidget extends StatelessWidget {
  final Category category;
  const CourseCategoryWidget({
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              AppDimens.largeRadius,
            ),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                category.background,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            category.title,
            style: context.textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
