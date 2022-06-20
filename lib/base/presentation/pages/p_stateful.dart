import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

abstract class PageStateful<T extends DialogProvider, P extends StatefulWidget>
    extends State<P> implements PageActions {
  late final NavigatorState navigator;
  late final T provider;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        afterFirstBuild(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isInitialized) {
      beforeBuild(context);
      isInitialized = true;
      ;
    }
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
  @mustCallSuper
  void beforeBuild(BuildContext context) {
    provider = Provider.of<T>(context, listen: false);
    navigator = context.navigator;
  }

  @override
  @mustCallSuper
  void afterFirstBuild(BuildContext context) {}
}
