import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_blur.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/detail/course_detail_lessions_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CourseDetailLessionsPage
    extends PageLoadingStateless<CourseDetailLessionsPageProvider> {
  final AnimationController lessionAnimationController;
  final Animation<double> lessionAnimation;

  CourseDetailLessionsPage({
    Key? key,
    required this.lessionAnimation,
    required this.lessionAnimationController,
  }) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
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
              onTap: () => context.navigator.pushNamed(Routes.lession),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "00$index".toString(),
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
                style: context.textTheme.bodySmall?.copyWith(),
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

  @override
  void initialization(BuildContext context) {}
}
