import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/services/dialogs/app_loading.dart';
import 'package:provider/provider.dart';

class WidgetLoadingBuilder<T extends LoadingProvider> extends StatelessWidget {
  final Widget parent;

  const WidgetLoadingBuilder(
    this.parent, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.select<T, bool>((provider) => provider.isLoading)
        ? AppLoading.showLoading(context)
        : AppLoading.dismissLoading(context);
    return parent;
  }
}
