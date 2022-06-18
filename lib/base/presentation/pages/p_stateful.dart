import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

abstract class PageStateful<T extends DialogProvider, P extends StatefulWidget>
    extends State<P> implements PageActions {
  late final NavigatorState navigator;
  late final T provider;

  @override
  void initState() {
    provider = Provider.of<T>(context, listen: false);
    navigator = context.navigator;
    initialization(context);
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      afterFirstBuild(context);
    });
  }

  @override
  void dispose() {
    provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) {}
}
