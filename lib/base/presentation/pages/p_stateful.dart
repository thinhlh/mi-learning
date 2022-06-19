import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/base/presentation/pages/page_actions.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

abstract class PageStateful<T extends Bloc, P extends StatefulWidget>
    extends State<P> implements PageActions {
  late final NavigatorState navigator;
  late final T bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<T>(context, listen: false);
    navigator = context.navigator;
    super.initState();

    beforeBuild(context);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (mounted) {
        afterFirstBuild(context);
      }
    });
  }

  @override
  void dispose() {
    bloc.close();
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

  @override
  void beforeBuild(BuildContext context) {}
}
