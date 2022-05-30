import 'package:flutter/cupertino.dart';
import 'package:mi_learning/base/presentation/providers/loading_provider.dart';

class HomeProvider extends LoadingProvider {
  final tabController = CupertinoTabController();

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
