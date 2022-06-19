import 'package:flutter/material.dart';

abstract class PageActions {
  /// This method is called as the page main content
  Widget buildPage(BuildContext context);

  /// This method is called for initialization or data fetching.
  /// In Stateless pages, it will be executed before build function
  ///
  /// In Stateful pages, it will be executed after initState.
  @mustCallSuper
  void beforeBuild(BuildContext context);

  /// This method is called only after the first frame built. It will be scheduled with Callback
  @mustCallSuper
  void afterFirstBuild(BuildContext context);

  // /// This method will be called **ONCE** before built of a widget.
  // ///
  // /// In Stateless pages, it will be executed before build function
  // ///
  // /// In Statefull pages, it will be executed after initstate.
  // @mustCallSuper
  // void calledOnceBeforeBuild(BuildContext context);
}
