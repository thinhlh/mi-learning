import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/providers/app_provider.dart';
import 'package:mi_learning/services/dialogs/app_dialog.dart';

abstract class DialogProvider extends AppProvider {
  Future<T?> showDialog<T>(BuildContext context, AlertDialog dialog) {
    return AppDialog.showAppDialog<T>(context, dialog);
  }

  void dismissDialog<T>(BuildContext context, {T? result}) {
    return AppDialog.dismissAppDialog(context, result: result);
  }
}
