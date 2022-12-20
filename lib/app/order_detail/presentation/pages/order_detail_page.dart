import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/common/domain/entity/course_entities/course.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/course_detail/domain/usecases/checkout_use_case.dart';
import 'package:mi_learning/app/order_detail/presentation/providers/order_detail_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/extensions/string_extension.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends PageLoadingStateless<OrderDetailPageProvider> {
  late final Course course;

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
              context.select<OrderDetailPageProvider, String>(
                (provider) => provider.userInfo?.name ?? "",
              ),
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            Text(
              context.select<OrderDetailPageProvider, String>(
                (provider) => (provider.userInfo?.role ?? "").toCamelCase(),
              ),
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
                  onPressed: () => navigator.pop(),
                  child: const Text(
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
                      course.title,
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '\$${NumberFormat.currency(symbol: '').format(course.price - course.price * 20 / 100)}'),
                    Text(
                      '\$${NumberFormat.currency(symbol: '').format(course.price)}',
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
                    child: Image.network(
                      course.background,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              itemCount: 1,
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            InkWell(
              onTap: () => navigator.pushNamed(Routes.payment).then(
                (value) {
                  provider.paymentResult = value as int;
                },
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payment',
                    style: context.textTheme.titleLarge,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: AppDimens.smallIcon,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.smallWidthDimens),
            Selector<OrderDetailPageProvider, int?>(
              selector: (_, provider) => provider.paymentResult,
              builder: (_, index, child) => Visibility(
                child: Text(
                  'Payment with ${index == 0 ? 'Momo' : 'Credit'}',
                  style: context.textTheme.titleSmall,
                ),
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
                  '\$${NumberFormat.currency(symbol: '').format(course.price)}',
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
                  '-\$${NumberFormat.currency(symbol: '').format(course.price * 20 / 100)}',
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
                  '+\$${NumberFormat.currency(symbol: '').format(course.price * 10 / 100)}',
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
                  '\$${NumberFormat.currency(symbol: '').format(course.price * 90 / 100)}',
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
                onPressed: () async {
                  showLoading(context, true);
                  final result =
                      await provider.checkout(CheckoutParam(course.id));
                  await Future.delayed(const Duration(seconds: 3));
                  showLoading(context, false);

                  result.fold(
                    (l) {
                      showDialog(
                        context: context,
                        builder: (_) => WDialog(
                          dialogType: DialogType.error,
                          content: l.message,
                          onActions: [],
                        ),
                      );
                    },
                    (r) => showDialog(
                      context: context,
                      builder: (_) => WDialog(
                        dialogType: DialogType.success,
                        content: 'Purchase Course Success',
                        onActions: [
                          () => navigator.pop(true),
                        ],
                      ),
                    ),
                  );
                },
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
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);
    course = context.getArgument<Course>()!;
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    provider.getBasicUserInfo();
  }
}
