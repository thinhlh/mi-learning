import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class WDialog extends Dialog {
  final DialogType dialogType;
  final String content;
  final List<void Function()> onActions;
  final String? title;
  final List<String>? actionStrings;
  final List<TextStyle?>? actionTextStyles;

  WDialog({
    Key? key,
    required this.dialogType,
    required this.content,
    required this.onActions,
    this.title,
    this.actionStrings,
    this.actionTextStyles,
  }) : super(
          key: key,
          child: SizedBox(
            height: 0.35.sh,
            width: 1.sw,
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
                      color: dialogType.primaryColor,
                    ),
                    foregroundPainter: IconPainter(
                      icon: dialogType.displayIcon,
                      iconColor: dialogType.iconColor,
                    ),
                    size: Size(0.25.sw, 0.25.sw),
                  ),
                ),
                Builder(
                  builder: (context) => Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimens.mediumWidthDimens,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title ?? dialogType.title,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: AppStyles.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        Flexible(
                          child: Text(
                            content,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium,
                            maxLines: null,
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        SizedBox(height: AppDimens.largeHeightDimens),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                                (actionStrings ?? [dialogType.actionString])
                                    .asMap()
                                    .map<int, Widget>(
                                      (index, actionString) => MapEntry(
                                        index,
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            if (onActions.isNotEmpty) {
                                              onActions[index].call();
                                            }
                                          },
                                          child: Text(
                                            actionString.toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: actionTextStyles?[index] ??
                                                context.textTheme.titleMedium
                                                    ?.copyWith(
                                                  fontWeight: AppStyles.bold,
                                                  color: dialogType
                                                      .primaryColorText,
                                                  letterSpacing: 4,
                                                ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList())
                      ],
                    ),
                  ),
                ),
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

class IconPainter extends CustomPainter {
  final Color? iconColor;
  final IconData icon;

  IconPainter({required this.icon, this.iconColor});
  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        fontSize: 40.r,
        fontFamily: icon.fontFamily,
        color: iconColor ?? AppColors.neutral.shade50,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width / 4, size.height / 4));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
