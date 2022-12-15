import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/article/domain/entities/article.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigator.pushNamed(
        Routes.articleViewer,
        arguments: article.url,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDimens.mediumRadius,
              ),
              child: AspectRatio(
                aspectRatio: 14 / 9,
                child: Image.network(
                  article.thumbnail,
                  alignment: Alignment.center,
                  width: 0.3.sw,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                  errorBuilder: (_, __, ___) => SizedBox(width: 0.3.sw),
                ),
              ),
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author,
                    maxLines: 1,
                    style: context.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    article.title,
                    softWrap: true,
                    style: context.textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateTimeHelper.format(article.createdAt),
                    maxLines: 2,
                    style: context.textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
