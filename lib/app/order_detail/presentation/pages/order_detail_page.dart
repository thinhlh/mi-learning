import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class OrderDetailPage extends PageLoadingStateless<OrderDetailPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Detail',
          style: context.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
              color: AppColors.neutral.shade900,
            ),
          ),
        ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart',
                  style: context.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Browse more',
                  ),
                ),
              ],
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
                      'Swift UI The completed course',
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
              itemCount: 3,
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            InkWell(
              onTap: () => navigator.pushNamed(Routes.payment),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payment',
                    style: context.textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: AppDimens.smallIcon,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Text(
              'Summary',
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: AppDimens.mediumWidthDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Original price',
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  '\$77.03',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: context.textTheme.titleMedium?.copyWith(),
                ),
                Text(
                  '\$48.00',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TAX',
                  style: context.textTheme.titleMedium?.copyWith(),
                ),
                Text(
                  '\$7.70',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const Divider(),
            SizedBox(height: AppDimens.smallHeightDimens),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total price',
                  style: context.textTheme.titleMedium?.copyWith(),
                ),
                Text(
                  '\$29.03',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: AppStyles.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'CHECKOUT',
                  style: TextStyle(
                    fontWeight: AppStyles.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
