import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class WCodeInput extends StatelessWidget {
  final bool numberOnly;
  final bool autofocus;
  final void Function(String) onChanged;
  const WCodeInput({
    Key? key,
    this.autofocus = false,
    required this.numberOnly,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimens.mediumWidthDimens,
      ),
      decoration: BoxDecoration(
        color: AppColors.neutral_50,
        borderRadius: BorderRadius.circular(
          AppDimens.largeRadius,
        ),
      ),
      child: TextField(
        autofocus: autofocus,
        textInputAction: TextInputAction.next,
        style: context.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) FocusScope.of(context).nextFocus();
          onChanged(value);
        },
        maxLength: 1,
        keyboardType: numberOnly ? TextInputType.number : TextInputType.text,
        buildCounter: (
          BuildContext context, {
          int? currentLength,
          int? maxLength,
          bool? isFocused,
        }) =>
            null,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textCapitalization: TextCapitalization.characters,
        textAlign: TextAlign.center,
      ),
    );
  }
}
