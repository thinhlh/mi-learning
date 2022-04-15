import 'package:flutter/material.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:provider/provider.dart';
import 'package:mi_learning/base/presentation/providers/dialog_provider.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

abstract class PageStateless<T extends DialogProvider> extends StatelessWidget
    implements PageActions {
  PageStateless({Key? key}) : super(key: key);

  late final NavigatorState navigator;
  late final T provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<T>(context, listen: false);
    navigator = context.navigator;
    initialization(context);

    return Scaffold(
      body: SafeArea(
        child: buildPage(context),
      ),
    );
  }
}
