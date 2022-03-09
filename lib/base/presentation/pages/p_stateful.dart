import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';
import 'package:provider/provider.dart';

abstract class PageStateful<T extends DialogProvider> extends StatefulWidget {}

abstract class PageState<T extends DialogProvider> extends State<PageStateful>
    with TickerProviderStateMixin
    implements PageActions {
  late final T provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of(context, listen: false);

    initialization(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }
}
