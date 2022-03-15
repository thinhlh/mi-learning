import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/p_stateful.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';
import 'package:mi_learning/base/presentation/widgets/w_loading_builder.dart';

/// Inherit this class to make the page is a stateful widget with support
/// From the loading dialog
abstract class PageLoadingStateful<T extends LoadingProvider>
    extends PageStateful<T> {
  const PageLoadingStateful({Key? key}) : super(key: key);
}

/// Inherit this class to create the state for above the above statefull widget
abstract class PageLoadingState<T extends LoadingProvider,
    P extends PageLoadingStateful> extends PageState<T, P> {
  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return WidgetLoadingBuilder<T>(buildPage(context), parent);
  }
}
