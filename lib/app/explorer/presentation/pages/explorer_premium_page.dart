import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_premium_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ExplorerPremiumPage
    extends PageLoadingStateless<ExplorerPremiumProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended for you',
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.3.sh,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: AppDimens.largeWidthDimens,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                      right: AppDimens.largeWidthDimens,
                    ),
                    width: 0.3.sw,
                    child: Column(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          elevation: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              24,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/flutter-course.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        Text(
                          'Flutter course from crash.',
                          style: context.textTheme.titleSmall,
                          maxLines: 2,
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '4.5 ★',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              '\$38',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  itemCount: 100,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended for you',
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.3.sh,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: AppDimens.largeWidthDimens,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                      right: AppDimens.largeWidthDimens,
                    ),
                    width: 0.3.sw,
                    child: Column(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          elevation: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              24,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/flutter-course.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        Text(
                          'Flutter course from crash.',
                          style: context.textTheme.titleSmall,
                          maxLines: 2,
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '4.5 ★',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              '\$38',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  itemCount: 100,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended for you',
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 0.3.sh,
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: AppDimens.largeWidthDimens,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                      right: AppDimens.largeWidthDimens,
                    ),
                    width: 0.3.sw,
                    child: Column(
                      children: [
                        Material(
                          type: MaterialType.transparency,
                          elevation: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              24,
                            ),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Image.asset(
                                'assets/images/flutter-course.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimens.mediumHeightDimens),
                        Text(
                          'Flutter course from crash.',
                          style: context.textTheme.titleSmall,
                          maxLines: 2,
                        ),
                        SizedBox(height: AppDimens.smallHeightDimens),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '4.5 ★',
                              style: context.textTheme.bodyMedium,
                            ),
                            Text(
                              '\$38',
                              style: context.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  itemCount: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
