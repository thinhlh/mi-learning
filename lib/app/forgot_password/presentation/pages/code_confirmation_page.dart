import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/presentation/widgets/error_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_back_button.dart';
import 'package:mi_learning/app/forgot_password/presentation/providers/code_confirmation_provider.dart';
import 'package:mi_learning/app/forgot_password/presentation/widgets/w_code_field.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class CodeConfirmationPage
    extends PageLoadingStateless<CodeConfirmationProvider> {
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
            'Verification',
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            "Fill in your the code we've sent you via message.",
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
                final result = await provider.verifyCode();
                provider.showDialog(
                  context,
                  ErrorDialog(),
                );
              },
              child: Text(
                'Veify',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.neutral_50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
    ;
  }

  @override
  void initialization(BuildContext context) {}
}
