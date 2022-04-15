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
    super.initState();
    provider = Provider.of<T>(context, listen: false);
    navigator = context.navigator;
  }

  @override
  Widget build(BuildContext context) {
    initialization(context);

    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }
}
