import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/app/article/presentation/blocs/article_page/article_page_bloc.dart';
import 'package:mi_learning/app/article/presentation/widgets/article_widget.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ArticleCategoryWidget extends StatelessWidget {
  final int parentIndex;

  const ArticleCategoryWidget({
    Key? key,
    required this.parentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ArticlePageBloc, ArticlePageState,
        Map<String, List<Article>>>(
      selector: (state) =>
          (state is ArticlePageLoadedState) ? state.articles : {},
      builder: (context, articles) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              articles.entries.toList().isEmpty
                  ? ""
                  : articles.entries.toList()[parentIndex].key,
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
              itemCount: articles.values.toList()[parentIndex].length,
              itemBuilder: (context, index) => ArticleWidget(
                article: articles.values.toList()[parentIndex][index],
              ),
            ),
          ],
        );
      },
    );
  }
}
