import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/auth/presentation/blocs/forgot_password/forgot_password_page_bloc.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_back_button.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage
    extends PageLoadingStateful<ForgotPasswordPageBloc, ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
            'Forgot password?',
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: AppStyles.bold,
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            "Fill in your email and we'll send a code to reset your password.",
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.textSubtitle,
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          WTextField(
            label: 'Email',
            icon: Icons.email_outlined,
            controller: emailController,
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<ForgotPasswordPageBloc, ForgotPasswordPageState>(
              builder: (_, state) =>
                  BlocConsumer<ForgotPasswordPageBloc, ForgotPasswordPageState>(
                listener: (context, state) {
                  if (state is ForgotPasswordPageInitialState) {
                  } else if (state is ForgotPasswordPageTimerState) {
                  } else if (state is ForgotPasswordPageSuccessState) {
                    showDialog(
                      context: context,
                      builder: (_) => WDialog(
                        dialogType: DialogType.success,
                        content: 'Password reset email has been sent!',
                        onActions: [
                          () => navigator.pushNamed(Routes.auth),
                        ],
                      ),
                    );
                  } else if (state is ForgotPasswordPageFailedState) {
                    showDialog(
                      context: context,
                      builder: (_) => WDialog(
                        dialogType: DialogType.error,
                        content: state.message,
                        onActions: const [],
                      ),
                    );
                  }
                },
                listenWhen: (previous, current) =>
                    current is ForgotPasswordPageSuccessState ||
                    current is ForgotPasswordPageFailedState,
                buildWhen: (previous, current) =>
                    current is ForgotPasswordPageInitialState ||
                    current is ForgotPasswordPageTimerState,
                builder: (context, state) {
                  final isInitialState =
                      state is ForgotPasswordPageInitialState;

                  return ElevatedButton(
                    onPressed: !isInitialState
                        ? null
                        : () async =>
                            bloc.sendPasswordReset(emailController.text),
                    child: Text(
                      isInitialState
                          ? 'Send me code'
                          : DateTimeHelper.formatDurationNoHout(
                              Duration(
                                seconds: const Duration(minutes: 2).inSeconds -
                                    (state as ForgotPasswordPageTimerState)
                                        .countDownTimer
                                        .tick,
                              ),
                            ),
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.neutral.shade50,
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(isInitialState
                          ? AppColors.neutral.shade400.withOpacity(0.7)
                          : AppColors.primarySwatch.shade500),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {}
}
