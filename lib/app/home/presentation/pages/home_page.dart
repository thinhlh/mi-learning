import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mi_learning/app/home/presentation/provider/home_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';

class HomePage extends PageLoadingStateless<HomeProvider> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        provider.showLoading(true);
        await provider.checkConnection();
        provider.showLoading(false);
      },
      child: Center(
        child: Selector<HomeProvider, String>(
          selector: (_, provider) => provider.title,
          builder: (_, value, child) => Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
