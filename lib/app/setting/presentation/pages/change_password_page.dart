import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/app/setting/presentation/providers/change_password_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ChangePasswordPage
    extends PageLoadingStateless<ChangePasswordPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
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
              'assets/images/change-password.svg',
              height: 0.3.sh,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
              ),
              child: Column(
                children: [
                  Text(
                    'Enter you current, new and confirmation password to reset.',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'Current password',
                    icon: Icons.lock_open_rounded,
                    controller: provider.currentPasswordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'New password',
                    icon: Icons.lock_outline_rounded,
                    controller: provider.passwordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'New password confirmation',
                    icon: Icons.password_rounded,
                    controller: provider.confirmPasswordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.largeHeightDimens),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showLoading(context, true);
                        final result = await provider.changePassword();
                        showLoading(context, false);
                        String? message = result.fold(
                          (failure) => failure.message,
                          (value) => value
                              ? null
                              : 'Current password and new password does not match.',
                        );

                        showDialog(
                          context: context,
                          builder: (_) => WDialog(
                            dialogType: message == null
                                ? DialogType.success
                                : DialogType.error,
                            content: message ?? 'Reset password success.',
                            onActions:
                                message == null ? [() => navigator.pop()] : [],
                          ),
                        );
                      },
                      child: const Text(
                        'Change password',
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

  @override
  void initialization(BuildContext context) {}
}
