import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mi_learning/app/landing/presentation/providers/landing_page_provider.dart';
import 'package:mi_learning/app/landing/presentation/widgets/landing_page_position.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LandingPage extends PageLoadingStateless<LandingPageProvider> {
  final PageController _pageController = PageController(keepPage: true);
  final Curve _paeTransitionCurves = Curves.linear;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primarySwatch.shade200,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LandingPagePosition(
            chosenIndex: context.select<LandingPageProvider, int>(
              (provider) => provider.currentPage,
            ),
            length: provider.landingPages(context).length,
          ),
          Container(
            width: 0.8.sw,
            margin: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
            ),
            child: ElevatedButton(
              onPressed: () {
                if (provider.currentPage ==
                    provider.landingPages(context).length - 1) {
                  navigator.pushNamed(Routes.auth);
                  return;
                }

                _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: _paeTransitionCurves,
                );
              },
              child: Selector<LandingPageProvider, int>(
                selector: (_, provider) => provider.currentPage,
                shouldRebuild: (oldValue, newValue) => oldValue != newValue,
                builder: (_, currentPage, child) => Text(
                  currentPage == 0
                      ? 'Get Started'
                      : currentPage != provider.landingPages(context).length - 1
                          ? 'Next'
                          : 'Sign In',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _pageController
                .animateToPage(
                  provider.landingPages(context).length - 1,
                  duration: const Duration(milliseconds: 400),
                  curve: _paeTransitionCurves,
                )
                .then(
                  (value) => navigator.pushNamed(Routes.auth),
                ),
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(
                top: AppDimens.largeHeightDimens,
                right: AppDimens.extraLargeWidthDimens,
              ),
              child: Text(
                'Skip',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.tetiary,
                  fontWeight: AppStyles.bold,
                ),
              ),
            ),
          ),
          const Spacer(flex: 1),
          _LandingImages(
            pageController: _pageController,
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.largeWidthDimens,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textTheme.titleLarge?.copyWith(),
                children: <TextSpan>[
                  for (dartz.Tuple2 value in provider
                      .landingPages(context)
                      .keys
                      .toList()[provider.currentPage])
                    TextSpan(text: value.value1, style: value.value2),
                ],
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

class _LandingImages extends StatefulWidget {
  final PageController pageController;

  _LandingImages({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<_LandingImages> createState() => _LandingImagesState();
}

class _LandingImagesState extends State<_LandingImages> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LandingPageProvider>();

    return SizedBox(
      height: 0.5.sh,
      child: PageView.builder(
        controller: widget.pageController,
        onPageChanged: (index) {
          provider.currentPage = index;
        },
        padEnds: true,
        physics: const BouncingScrollPhysics(),
        itemCount: provider.landingPages(context).length,
        itemBuilder: (_, index) => SvgPicture.asset(
          provider.landingPages(context).values.toList()[index],
        ),
      ),
    );
  }
}
