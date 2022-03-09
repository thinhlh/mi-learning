import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:provider/provider.dart';
import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';

abstract class PageStateless<T extends DialogProvider> extends StatelessWidget
    implements PageActions {
  PageStateless({Key? key}) : super(key: key);

  late final T provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<T>(context, listen: false);
    initialization(context);

    return Scaffold(
      body: buildPage(context),
    );
  }
}
