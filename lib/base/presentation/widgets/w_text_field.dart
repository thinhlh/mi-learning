import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class WidgetTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType? inputType;
  bool? obsercureText;

  WidgetTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.icon,
    this.inputType,
    this.obsercureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.extraLargeRadius),
        color: AppColors.neutral.shade50,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.largeWidthDimens,
        vertical: AppDimens.largeWidthDimens,
      ),
      child: StatefulBuilder(
        builder: (_, setState) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.textSecondary,
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label.toUpperCase(),
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  TextFormField(
                    controller: controller,
                    keyboardType: inputType,
                    obscureText: obsercureText ?? false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    cursorColor: AppColors.neutral.shade800,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppStyles.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppDimens.largeWidthDimens),
            obsercureText != null
                ? GestureDetector(
                    onTap: () =>
                        setState(() => obsercureText = !obsercureText!),
                    child: Icon(
                      obsercureText!
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
