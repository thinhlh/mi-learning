import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class ErrorDialog extends Dialog {
  ErrorDialog({
    Key? key,
  }) : super(
          key: key,
          child: SizedBox(
            height: 0.4.sh,
            width: 0.5.sw,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      AppDimens.extraLargeRadius,
                    ),
                  ),
                  child: CustomPaint(
                    painter: QuaterCirclePainter(
                      color: AppColors.error,
                    ),
                    size: Size(0.25.sw, 0.25.sw),
                  ),
                ),
                Builder(builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Oh snap!',
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Text(
                        'Your transaction was declined by the bank due to the insufficient funds. Please try again.',
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium,
                      ),
                      SizedBox(height: AppDimens.largeHeightDimens),
                      Text(
                        'Try again',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.errorText,
                        ),
                      )
                    ],
                  );
                }),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimens.extraLargeRadius,
            ),
          ),
        );
}

class QuaterCirclePainter extends CustomPainter {
  QuaterCirclePainter({required this.color}) : super();

  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    const Offset center = Offset(0, 0);

    canvas.drawCircle(center, size.width, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
