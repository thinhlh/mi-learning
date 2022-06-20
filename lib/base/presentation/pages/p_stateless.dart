import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

abstract class PageStateless<T extends Bloc> extends StatelessWidget
    implements PageActions {
  PageStateless({Key? key}) : super(key: key);

  late final NavigatorState navigator;
  late final T bloc;

  @override
  @mustCallSuper
  void afterFirstBuild(BuildContext context) {}

  @override
  @mustCallSuper
  void beforeBuild(BuildContext context) {
    bloc = context.read<T>();
    navigator = context.navigator;
  }

  @override
  Widget build(BuildContext context) {
    beforeBuild(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      afterFirstBuild(context);
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }
}
