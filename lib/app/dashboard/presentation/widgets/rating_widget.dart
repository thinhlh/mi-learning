import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final Axis direction;
  final bool showValue;
  RatingWidget({
    Key? key,
    required this.rating,
    this.direction = Axis.horizontal,
    this.showValue = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = List.generate(
      5,
      (index) => Icon(
        (rating - index >= 1)
            ? Icons.star
            : (rating - index >= 0.5)
                ? Icons.star_half
                : Icons.star_outline,
        color: Colors.yellow.shade800,
      ),
    );

    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: showValue,
          child: Text(
            rating.toStringAsFixed(1),
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.yellow.shade900,
              fontWeight: AppStyles.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppDimens.mediumWidthDimens),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: stars,
          ),
        )
      ],
    );
  }
}
