import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/article/presentation/providers/article_page_provider.dart';
import 'package:mi_learning/app/article/presentation/widgets/article_widget.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class ArticleCategoryWidget extends StatelessWidget {
  final int parentIndex;

  const ArticleCategoryWidget({
    Key? key,
    required this.parentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ArticlePageProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          provider.articles.entries.toList()[parentIndex].key,
          style: context.textTheme.titleSmall?.copyWith(
            color: AppColors.neutral.shade700,
          ),
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        ListView.separated(
          separatorBuilder: (_, index) => SizedBox(
            height: AppDimens.mediumHeightDimens,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.articles.values.toList()[parentIndex].length,
          itemBuilder: (context, index) => ArticleWidget(
            article: provider.articles.values.toList()[parentIndex][index],
          ),
        ),
      ],
    );
  }
}
