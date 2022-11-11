import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/services/dialogs/app_loading.dart';

class WidgetLoadingBuilder<T extends LoadingProvider> extends StatelessWidget {
  void showLoading(BuildContext context, bool show) {
    show ? AppLoading.showLoading(context) : AppLoading.dismissLoading(context);
  }

  final Widget parent;

  const WidgetLoadingBuilder(
    this.parent, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          parent,
        ],
      ),
    );
  }
}
