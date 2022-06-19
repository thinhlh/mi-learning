import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/app/setting/presentation/blocs/change_password_page/change_password_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ChangePasswordPage extends PageLoadingStateless<ChangePasswordPageBloc> {
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
                    controller: bloc.currentPasswordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'New password',
                    icon: Icons.lock_outline_rounded,
                    controller: bloc.passwordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'New password confirmation',
                    icon: Icons.password_rounded,
                    controller: bloc.confirmPasswordController,
                    obsercureText: true,
                  ),
                  SizedBox(height: AppDimens.largeHeightDimens),
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<ChangePasswordPageBloc,
                        ChangePasswordPageState>(
                      listener: (context, state) {
                        if (state is ChangePasswordPageLoadingState) {
                          showLoading(context, true);
                        } else {
                          showLoading(context, false);
                          if (state is ChangePasswordPageInitialState) {
                          } else if (state is ChangePasswordPageSuccessState) {
                            String message = 'Reset password success.';
                            showDialog(
                              context: context,
                              builder: (_) => WDialog(
                                dialogType: DialogType.success,
                                content: message,
                                onActions: [() => navigator.pop()],
                              ),
                            );
                          } else if (state is ChangePasswordPageFailedState) {
                            String message = state.message;
                            showDialog(
                              context: context,
                              builder: (_) => WDialog(
                                dialogType: DialogType.error,
                                content: message,
                                onActions: [() => navigator.pop()],
                              ),
                            );
                          }
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            bloc.changePassword();
                          },
                          child: const Text(
                            'Change password',
                          ),
                        );
                      },
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
  void beforeBuild(BuildContext context) {}
}
