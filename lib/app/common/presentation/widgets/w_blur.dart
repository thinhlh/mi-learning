import 'dart:ui';

import 'package:flutter/material.dart';

/// An widget that will overlay and blur it's child
class WBlur extends StatelessWidget {
  final Widget child;
  final bool blur;
  final Widget? overlayChild;

  const WBlur({
    Key? key,
    required this.child,
    required this.blur,
    this.overlayChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blur ? 1.5 : 0,
              sigmaY: blur ? 1.5 : 0,
            ),
            child: Container(
              color: Colors.white.withOpacity(0),
            ),
          ),
        ),
        Positioned.fill(
          child:
              (blur && overlayChild != null) ? overlayChild! : const SizedBox(),
        )
      ],
    );
  }
}
