import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/payment/presentation/providers/payment_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class PaymentPage extends PageLoadingStateless<PaymentProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.isDarkMode
                ? AppColors.neutral.shade500
                : AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
        title: Text(
          'Payment Method',
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.extraLargeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(top: AppDimens.largeHeightDimens),
          child: Column(
            children: [
              Text(
                'How do you want to make your purchase?',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppStyles.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimens.extraLargeHeightDimens),
              ListView.separated(
                separatorBuilder: (_, index) => SizedBox(
                  height: AppDimens.extraLargeHeightDimens,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (_, index) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.8,
                      color: AppColors.tetiary,
                    ),
                    borderRadius: BorderRadius.circular(
                      AppDimens.largeRadius,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.largeWidthDimens,
                    vertical: AppDimens.largeHeightDimens,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Payment with Credit Card',
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: AppStyles.extraBold,
                              ),
                              softWrap: true,
                            ),
                          ),
                          const Icon(
                            Icons.credit_card_rounded,
                          ),
                        ],
                      ),
                      SizedBox(height: AppDimens.mediumHeightDimens),
                      Text(
                        'Reliable third party wallet in Vietnam',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: AppDimens.smallHeightDimens),
                      Text(
                        'Get valuable cashback on every charge.',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.textTheme.bodyMedium?.color,
                        ),
                      ),
                      SizedBox(height: AppDimens.smallHeightDimens),
                      Text(
                        'Fees and limit vary',
                        style: context.textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
