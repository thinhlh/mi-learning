import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/rating.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ReviewWidget extends StatelessWidget {
  final Rating? rating;
  const ReviewWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: AppDimens.mediumHeightDimens,
      // contentPadding: EdgeInsets.all(0),
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          rating?.avatar ?? "",
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rating?.name ?? "",
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          RatingWidget(
            rating: (rating?.value ?? 0).toDouble(),
            showValue: false,
            starSize: AppDimens.smallIcon,
          )
        ],
      ),

      subtitle: ExpandableText(
        rating?.content ?? "",
        expandText: 'Read more',
        style: context.textTheme.bodyMedium?.copyWith(),
        maxLines: 3,
        collapseText: 'Show less',
      ),
    );
  }
}
