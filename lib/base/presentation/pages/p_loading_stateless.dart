import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/widgets/w_loading_builder.dart';
import 'package:mi_learning/base/presentation/pages/p_stateless.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

abstract class PageLoadingStateless<T extends LoadingProvider>
    extends PageStateless<T> {
  PageLoadingStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parent = super.build(context);

    return WidgetLoadingBuilder<T>(buildPage(context), parent);
  }
}
