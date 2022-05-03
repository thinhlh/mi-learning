import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_blur.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailPage extends PageLoadingStateless<CourseDetailProvider> {
  late final int id;
  CourseDetailPage({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade100,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.r),
          ),
          color: AppColors.neutral.shade50,
        ),
        margin: EdgeInsets.symmetric(horizontal: AppDimens.mediumWidthDimens),
        padding: EdgeInsets.all(AppDimens.largeWidthDimens),
        child: Column(
          children: [
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Flutter TDD Clean Architecture Course',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.extraBold,
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'by Reso coder',
                style: context.textTheme.caption?.copyWith(
                  fontSize: context.textTheme.subtitle2?.fontSize,
                ),
              ),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(
                  0.9,
                  0.85,
                ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.largeRadius),
                ),
                child: Image.asset(
                  'assets/images/flutter-course.jpeg',
                ),
                elevation: AppDimens.largeElevation,
                clipBehavior: Clip.hardEdge,
              ),
            ),
            const Expanded(child: _CouseDetailAppBar())
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primarySwatch.shade100,
      centerTitle: true,
      // elevation: AppDimens.smallElevation,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.isDarkMode
              ? AppColors.neutral.shade50
              : AppColors.neutral.shade900,
        ),
        onPressed: () => navigator.pop(),
      ),
      title: Text(
        'Course Detail',
        style: context.textTheme.titleLarge?.copyWith(),
      ),
      actions: [
        StatefulBuilder(
          builder: (_, setState) => IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Random().nextBool()
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: AppColors.neutral.shade900,
            ),
          ),
        )
      ],
    );
  }

  @override
  void initialization(BuildContext context) {
    id = context.getArgument<int>() ?? 0;
  }
}

class _CouseDetailAppBar extends StatefulWidget {
  const _CouseDetailAppBar({Key? key}) : super(key: key);

  @override
  State<_CouseDetailAppBar> createState() => __CouseDetailAppBarState();
}

class __CouseDetailAppBarState extends State<_CouseDetailAppBar>
    with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController lessionAnimationController;
  late final Animation<double> lessionAnimation;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!tabController.indexIsChanging) {
          if (tabController.index == 1) {
            lessionAnimationController.forward();
          } else {
            lessionAnimationController.reset();
          }
        }
      });

    lessionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    lessionAnimation = CurveTween(curve: Curves.easeInOutQuad).animate(
      Tween<double>(begin: 0, end: 0.8).animate(lessionAnimationController)
        ..addListener(() {
          setState(() {});
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          bottom: TabBar(
            labelStyle: context.textTheme.titleMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
            unselectedLabelStyle: context.textTheme.titleMedium,
            indicatorColor: AppColors.secondary,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(text: 'About'),
              Tab(text: 'Lession'),
              Tab(text: 'Discuss'),
              Tab(text: 'Ratings'),
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            _buildAbout(context),
            _buildLession(context),
            _buildDiscuss(context),
            _buildRatings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppDimens.largeHeightDimens),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '12',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                  SizedBox(height: AppDimens.smallHeightDimens),
                  Text(
                    'Lessions',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '38,729',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                  SizedBox(height: AppDimens.smallHeightDimens),
                  Text(
                    'Students',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '23',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                  SizedBox(height: AppDimens.smallHeightDimens),
                  Text(
                    'Hours',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: AppDimens.extraLargeHeightDimens,
            color: AppColors.neutral.shade500,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/user-avatar-1.jpg',
                ),
              ),
              SizedBox(width: AppDimens.mediumWidthDimens),
              Text(
                'Reso Coder',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: AppStyles.bold,
                ),
              ),
              Spacer(),
              StatefulBuilder(builder: (context, setState) {
                return TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    'Follow',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.bold,
                      color: Random().nextBool()
                          ? Colors.red
                          : AppColors.neutral.shade500,
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          ExpandableText(
            text:
                "Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.",
            maxLines: 3,
            textStyle: context.textTheme.bodyMedium?.copyWith(
                // fontSize: AppDimens.mediumText,
                ),
            showTextStyle: context.textTheme.caption?.copyWith(
              fontWeight: AppStyles.extraBold,
              color: AppColors.primarySwatch.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLession(BuildContext context) {
    final Widget lessons = SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration.zero,
            child: CircularProgressIndicator(
              value: lessionAnimation.value,
              strokeWidth: 6,
              backgroundColor: AppColors.neutral.shade400,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.primarySwatch.shade300,
              ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            '80/100 lessions',
            style: context.textTheme.titleLarge,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: AppDimens.largeHeightDimens),
            shrinkWrap: true,
            itemBuilder: (_, index) => ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "00${index}".toString(),
                    style: context.textTheme.titleLarge?.copyWith(
                      color: AppColors.neutral.shade400,
                    ),
                  ),
                ],
              ),
              title: Text(
                'Lession Title',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: AppStyles.bold,
                ),
              ),
              subtitle: Text(
                'Lession Subtitle',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: AppStyles.light,
                ),
              ),
              trailing: CircleAvatar(
                backgroundColor: AppColors.success,
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.neutral.shade50,
                ),
              ),
            ),
            itemCount: 5,
          ),
        ],
      ),
    );
    bool isBlur = true;
    return StatefulBuilder(
      builder: (_, setState) {
        return isBlur
            ? WBlur(
                blur: isBlur,
                overlayChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      size: AppDimens.largeIcon,
                    ),
                    SizedBox(height: AppDimens.mediumHeightDimens),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isBlur = !isBlur;
                        });
                      },
                      child: Text(
                        'Enroll in this course',
                        style: context.textTheme.titleSmall?.copyWith(
                          color: AppColors.neutral.shade50,
                          fontWeight: AppStyles.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.tetiary,
                        ),
                        elevation: MaterialStateProperty.all(
                            AppDimens.mediumElevation),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            horizontal: AppDimens.largeWidthDimens,
                            vertical: AppDimens.largeHeightDimens,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                child: lessons,
              )
            : lessons;
      },
    );
  }

  Widget _buildRatings(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimens.largeHeightDimens),
        Card(
          color: AppColors.neutral.shade200,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(AppDimens.largeWidthDimens),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RatingWidget(
                    showValue: false,
                    rating: 4.0,
                    direction: Axis.horizontal,
                  ),
                ),
                SizedBox(width: AppDimens.extraLargeWidthDimens),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('5 star'),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                              AppDimens.mediumRadius,
                            )),
                            child: Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    color: AppColors.neutral.shade100,
                                    height: 10.w,
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 1,
                                    child: Container(
                                      color: AppColors.secondary,
                                      height: 10.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('4 star'),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  color: AppColors.neutral.shade100,
                                  height: 10.w,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: Container(
                                    color: AppColors.secondary,
                                    height: 10.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('3 star'),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  color: AppColors.neutral.shade100,
                                  height: 10.w,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.6,
                                  child: Container(
                                    color: AppColors.secondary,
                                    height: 10.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('2 star'),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  color: AppColors.neutral.shade100,
                                  height: 10.w,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.4,
                                  child: Container(
                                    color: AppColors.secondary,
                                    height: 10.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text('1 star'),
                          SizedBox(width: AppDimens.largeWidthDimens),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  color: AppColors.neutral.shade100,
                                  height: 10.w,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.2,
                                  child: Container(
                                    color: AppColors.secondary,
                                    height: 10.w,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiscuss(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(
              top: AppDimens.largeHeightDimens,
              left: AppDimens.largeWidthDimens,
              right: AppDimens.largeWidthDimens,
            ),
            separatorBuilder: (_, index) => Divider(
              height: 0,
              color: AppColors.neutral.shade500,
            ),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimens.smallHeightDimens,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                leading: Container(
                  padding: EdgeInsets.all(AppDimens.smallWidthDimens),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: AppColors.primary,
                    size: 20.r,
                  ),
                ),
                title: Text('Discussion No.$index'),
                subtitle: Text(
                  '$index openned 11 days ago by venetus',
                  maxLines: 1,
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
