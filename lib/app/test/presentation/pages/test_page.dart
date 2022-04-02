import 'package:flutter/material.dart';
import 'package:mi_learning/app/test/presentation/provider/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';

class TestPage extends PageLoadingStateless<TestProvider> {
  TestPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        provider.showLoading(true);
        await provider.checkConnection();
        provider.showLoading(false);
      },
      child: Center(
        child: Selector<TestProvider, String>(
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
