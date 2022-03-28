import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/p_stateful.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/base/presentation/widgets/w_loading_builder.dart';

/// Inherit this class to create the state for above the above statefull widget
abstract class PageLoadingStateful<T extends LoadingProvider,
    P extends StatefulWidget> extends PageStateful<T, P> {
  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return WidgetLoadingBuilder<T>(parent);
  }
}
