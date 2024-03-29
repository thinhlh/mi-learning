import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mi_learning/app/auth/presentation/provider/code_confirmation_page_provider.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_back_button.dart';
import 'package:mi_learning/app/forgot_password/presentation/widgets/w_code_field.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CodeConfirmationPage
    extends PageLoadingStateless<CodeConfirmationPageProvider> {
  CodeConfirmationPage({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.extraLargeHeightDimens),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WBackButton(),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            tr(LocaleKeys.pages_code_information_verification),
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            tr(LocaleKeys.pages_code_information_fill_in_code),
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.textSubtitle,
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          WCodeField(
            length: 4,
            numberOnly: true,
            onCodeEntered: (value) => provider.code = value,
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                navigator.pushReplacementNamed(Routes.home);
                // final result = await provider.verifyCode();

                // if (result == 2) {
                //   provider.showDialog(
                //     context,
                //     WDialog(
                //       dialogType: DialogType.success,
                //       content:
                //           'You have changed your password. Please proceed your experience.',
                //       onActions: [
                //         () {
                //           navigator.pushNamed(Routes.home);
                //         }
                //       ],
                //     ),
                //   );
                // } else if (result == 1) {
                //   provider.showDialog(
                //     context,
                //     WDialog(
                //       dialogType: DialogType.error,
                //       content:
                //           'Your transaction was declined by the bank due to the insufficient funds. Please try again.',
                //       onActions: [
                //         () {
                //           navigator.pushNamed(Routes.home);
                //         }
                //       ],
                //     ),
                //   );
                // } else {
                //   provider.showDialog(
                //     context,
                //     WDialog(
                //       dialogType: DialogType.info,
                //       content:
                //           'You have to fill in your verification code. After that click verify to proceed changing the password.',
                //       onActions: [
                //         () {
                //           navigator.pushNamed(Routes.home);
                //         }
                //       ],
                //     ),
                //   );
                // }
              },
              child: Text(
                'Veify',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.neutral.shade50,
                  fontWeight: AppStyles.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
