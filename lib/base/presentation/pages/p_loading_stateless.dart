import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_stateless.dart';
import 'package:mi_learning/services/dialogs/app_loading.dart';

abstract class PageLoadingStateless<T extends Bloc> extends PageStateless<T> {
  PageLoadingStateless({Key? key}) : super(key: key);

  void showLoading(BuildContext context, bool show) {
    show ? AppLoading.showLoading(context) : AppLoading.dismissLoading(context);
  }

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}
