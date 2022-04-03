import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  RatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rating.toStringAsFixed(1),
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.yellow.shade900,
            fontWeight: AppStyles.bold,
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.only(left: AppDimens.mediumWidthDimens),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (_, index) => Icon(
            (rating - index >= 1)
                ? Icons.star
                : (rating - index >= 0.5)
                    ? Icons.star_half
                    : Icons.star_outline,
            color: Colors.yellow.shade800,
          ),
        )
      ],
    );
  }
}
