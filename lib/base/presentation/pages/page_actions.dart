import 'package:flutter/material.dart';

abstract class PageActions {
  /// This method is called as the page main content
  Widget buildPage(BuildContext context);

  /// This method is called for initialization of dependency.
  /// In Stateless pages, it will be executed before build function
  ///
  /// In Stateful pages, it will be executed after initState.
  ///
  /// DO NOT PERFORM ACTION RELATED TO NAVIGATION IN THIS METHOD
  @mustCallSuper
  void beforeBuild(BuildContext context);

  /// This method is called for data fetching.
  /// This method will be executed on callback after the first build finished
  @mustCallSuper
  void afterFirstBuild(BuildContext context);
}
