import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/rating_widget.dart';
import 'package:mi_learning/app/feedback/presentation/providers/feedback_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends PageLoadingStateless<FeedbackPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/feedback.svg',
              height: 0.3.sh,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
              ),
              child: Column(
                children: [
                  Text(
                    'Tell us what you think!',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'content',
                    icon: Icons.feedback_outlined,
                    inputType: TextInputType.multiline,
                    maxLines: 10,
                    controller: provider.contentController,
                    maxLength: 300,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  Text(
                    'Rating our plarform.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  Consumer<FeedbackPageProvider>(
                    builder: (_, provider, child) {
                      return RatingWidget(
                        showRatingAnimation: true,
                        showValue: false,
                        rating: provider.currentRating.toDouble(),
                        onStarTap: (star) => provider.currentRating = star,
                      );
                    },
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        String? message;
                        showDialog(
                          context: context,
                          builder: (_) => WDialog(
                            dialogType: message == null
                                ? DialogType.success
                                : DialogType.error,
                            content: message ?? 'Thank you for your feed back.',
                            onActions:
                                message == null ? [() => navigator.pop()] : [],
                          ),
                        );
                      },
                      child: const Text(
                        'Submit',
                      ),
                    ),
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
