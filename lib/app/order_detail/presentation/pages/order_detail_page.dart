import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class OrderDetailPage extends PageLoadingStateless<OrderDetailProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Detail',
          style: context.textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => navigator.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.isDarkMode
                ? AppColors.neutral.shade500
                : AppColors.neutral.shade900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing Detail',
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Text(
              'Hoang Thinh',
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            Text(
              'Role',
              style: context.textTheme.bodySmall,
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            Text(
              'Cart',
              style: context.textTheme.titleLarge,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) => ListTile(
                minLeadingWidth: 0,
                contentPadding: EdgeInsets.zero,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Swift UI Senior course',
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$9.99'),
                    Text(
                      '\$25.99',
                      style: context.textTheme.bodyMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                leading: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppDimens.largeRadius,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/swift.svg',
                    ),
                  ),
                ),
              ),
              itemCount: 30,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
