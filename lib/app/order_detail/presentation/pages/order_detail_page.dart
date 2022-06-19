import 'dart:html';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/order_detail/presentation/bloc/order_detail_page_bloc.dart';
import 'package:mi_learning/app/setting/presentation/blocs/setting_page/setting_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/extensions/string_extension.dart';

class OrderDetailPage extends PageLoadingStateless<OrderDetailPageBloc> {
  late final Course course;

  OrderDetailPage({Key? key}) : super(key: key);

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
            BlocBuilder<OrderDetailPageBloc, OrderDetailPageState>(
              builder: (context, state) {
                return Text(
                  state is OrderDetailPageLoadedState
                      ? state.userInfo.name
                      : "",
                  style: context.textTheme.bodyLarge,
                );
              },
              buildWhen: (previous, current) =>
                  current is OrderDetailPageLoadedState ||
                  current is OrderDetailPageInitialState,
            ),
            SizedBox(height: AppDimens.smallHeightDimens),
            BlocBuilder<OrderDetailPageBloc, OrderDetailPageState>(
              buildWhen: (previous, current) =>
                  current is OrderDetailPageLoadedState ||
                  current is OrderDetailPageInitialState,
              builder: (context, state) {
                return Text(
                  (state is OrderDetailPageLoadedState
                          ? state.userInfo.role
                          : "")
                      .toCamelCase(),
                  style: context.textTheme.bodySmall,
                );
              },
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
                    (value) => bloc.changePaymentMethos(value as int),
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
            BlocBuilder<OrderDetailPageBloc, OrderDetailPageState>(
                buildWhen: (previous, current) =>
                    current is OrderDetailPageInitialState ||
                    current is OrderDetailPageLoadedState,
                builder: (_, state) {
                  final paymentMethod = (state is OrderDetailPageInitialState)
                      ? state.paymentMethod
                      : (state as OrderDetailPageLoadedState).paymentMethod;
                  return Visibility(
                    child: Text(
                      'Payment with ${paymentMethod == 0 ? 'Momo' : 'Credit'}',
                      style: context.textTheme.titleSmall,
                    ),
                  );
                }),
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
              child: BlocListener<OrderDetailPageBloc, OrderDetailPageState>(
                listener: (context, state) {
                  if (state is OrderDetailPageSuccessState) {
                    showLoading(context, false);
                    showDialog(
                      context: context,
                      builder: (_) => WDialog(
                        dialogType: DialogType.success,
                        content: 'Purchase Course Success',
                        onActions: [
                          () => navigator.pop(true),
                        ],
                      ),
                    );
                  } else if (state is OrderDetailPageFailedState) {
                    showLoading(context, false);
                    showDialog(
                      context: context,
                      builder: (_) => WDialog(
                        dialogType: DialogType.error,
                        content: state.message,
                        onActions: [],
                      ),
                    );
                  } else if (state is SettingPageLoadingState) {
                    showLoading(context, true);
                  } else {
                    showLoading(context, false);
                  }
                },
                listenWhen: (_, state) =>
                    state is OrderDetailPageSuccessState ||
                    state is OrderDetailPageFailedState,
                child: ElevatedButton(
                  onPressed: () => bloc.checkout(course),
                  child: const Text(
                    'CHECKOUT',
                    style: TextStyle(
                      fontWeight: AppStyles.bold,
                      letterSpacing: 2,
                    ),
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
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    course = context.getArgument<Course>()!;
    bloc.getBasicUserInfo();
  }
}
