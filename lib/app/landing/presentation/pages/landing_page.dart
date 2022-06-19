import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mi_learning/app/landing/presentation/bloc/landing_page_bloc.dart';
import 'package:mi_learning/app/landing/presentation/widgets/landing_page_position.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class LandingPage extends PageLoadingStateless<LandingPageBloc> {
  final PageController _pageController = PageController(keepPage: true);
  final Curve _paeTransitionCurves = Curves.linear;
  late final Map<List<dartz.Tuple2<String, TextStyle?>>, String> landingPages;

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocSelector<LandingPageBloc, LandingPageState, int>(
            selector: (state) => state.currentPage,
            builder: (_, currentPages) => LandingPagePosition(
              chosenIndex: currentPages,
              length: currentPages,
            ),
          ),
          Container(
            width: 0.8.sw,
            margin: EdgeInsets.symmetric(
              vertical: AppDimens.largeHeightDimens,
            ),
            child: BlocSelector<LandingPageBloc, LandingPageState, int>(
              selector: (state) {
                return state.currentPage;
              },
              builder: (context, currentPage) {
                return ElevatedButton(
                  onPressed: () {
                    if (currentPage == landingPages.length - 1) {
                      navigator.pushNamed(Routes.auth);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: _paeTransitionCurves,
                      );
                    }
                  },
                  child: Text(
                    currentPage == 0
                        ? 'Get Started'
                        : currentPage != landingPages.length - 1
                            ? 'Next'
                            : 'Sign In',
                  ),
                );
              },
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
                  landingPages.length - 1,
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
                  for (dartz.Tuple2 value
                      in landingPages.keys.toList()[bloc.state.currentPage])
                    TextSpan(
                      text: value.value1,
                      style: value.value2,
                    ),
                ],
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    landingPages = bloc.state.landingPages(context);
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
    final bloc = context.read<LandingPageBloc>();
    final landingPages = bloc.state.landingPages(context);

    return SizedBox(
      height: 0.5.sh,
      child: PageView.builder(
        controller: widget.pageController,
        onPageChanged: (index) {
          bloc.goToNextPage(index);
        },
        padEnds: true,
        physics: const BouncingScrollPhysics(),
        itemCount: landingPages.length,
        itemBuilder: (_, index) => SvgPicture.asset(
          landingPages.values.toList()[index],
        ),
      ),
    );
  }
}
