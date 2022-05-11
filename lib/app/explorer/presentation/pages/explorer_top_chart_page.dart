import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_top_chart_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ExplorerTopChartPage
    extends PageLoadingStateless<ExplorerTopChartProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeHeightDimens,
      ),
      itemBuilder: (_, index) => Container(
        padding: EdgeInsets.only(top: AppDimens.extraLargeHeightDimens),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  (index + 1).toString(),
                  style: context.textTheme.titleMedium,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 13,
                child: Row(
                  children: [
                    SizedBox(width: AppDimens.largeWidthDimens),
                    Material(
                      borderRadius: BorderRadius.circular(
                        AppDimens.largeRadius,
                      ),
                      elevation: AppDimens.smallElevation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppDimens.largeRadius,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            'assets/images/flutter-course.jpeg',
                            fit: BoxFit.cover,
                            height: 0.05.sh,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: AppDimens.largeWidthDimens),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flutter Crash Course for Developer',
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(height: AppDimens.smallHeightDimens),
                          Text(
                            'Reso Coder',
                            style: context.textTheme.bodyLarge,
                          ),
                          SizedBox(height: AppDimens.smallHeightDimens),
                          Text(
                            'Beginner • Intermediate',
                            style: context.textTheme.subtitle2?.copyWith(
                              fontWeight: AppStyles.light,
                            ),
                          ),
                          SizedBox(height: AppDimens.smallHeightDimens),
                          Row(
                            children: [
                              Text(
                                '\$38',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: AppStyles.bold,
                                ),
                              ),
                              SizedBox(width: AppDimens.mediumWidthDimens),
                              Text(
                                '4.5 ★',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: AppStyles.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      itemCount: 100,
    );
  }

  @override
  void initialization(BuildContext context) {}
}
