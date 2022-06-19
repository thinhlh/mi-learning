import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_stateful.dart';
import 'package:mi_learning/services/dialogs/app_loading.dart';

/// Inherit this class to create the state for above the above statefull widget
abstract class PageLoadingStateful<T extends Bloc, P extends StatefulWidget>
    extends PageStateful<T, P> {
  void showLoading(BuildContext context, bool show) {
    show ? AppLoading.showLoading(context) : AppLoading.dismissLoading(context);
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
