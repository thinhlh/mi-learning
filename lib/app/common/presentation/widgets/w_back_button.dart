import 'package:flutter/material.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class WBackButton extends StatelessWidget {
  final dynamic data;
  const WBackButton({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(data),
      child: Container(
        padding: EdgeInsets.all(AppDimens.largeHeightDimens),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimens.largeRadius),
          border: Border.all(color: AppColors.neutral_400),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.neutral_800,
        ),
      ),
    );
  }
}
