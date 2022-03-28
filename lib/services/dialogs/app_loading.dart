import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/widgets/w_loading.dart';

class AppLoading {
  static BuildContext? _context;
  static bool _isShowing = false;
  AppLoading._internal();

  /// Show the dialog and store it's context for further dismiss
  static Future showLoading(BuildContext context) {
    _context = context;
    if (_isShowing) return Future.value();
    _isShowing = true;
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => const LoadingWidget(
        color: Colors.white,
      ),
    );
  }

  static void dismissLoading(BuildContext context) async {
    if (_context == null) {
      // Do nothing
    } else {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
        _context = null;
        _isShowing = false;
      }
    }
  }
}
