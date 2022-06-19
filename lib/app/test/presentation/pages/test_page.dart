import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/test/presentation/bloc/test_page_bloc.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';

class TestPage extends PageLoadingStateless<TestPageBloc> {
  TestPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bloc.checkConnection();
      },
      child: Center(
        child: BlocConsumer<TestPageBloc, TestPageState>(
          listener: (_, state) {
            if (state is TestPageLoadingState) {
              showLoading(context, true);
            } else if (state is TestPageLoadedState) {
              showLoading(context, false);
            } else if (state is TestPageFailedState) {
              showLoading(context, false);
              showDialog(
                context: context,
                builder: (_) => WDialog(
                  dialogType: DialogType.error,
                  content: state.message,
                  onActions: const [],
                ),
              );
            }
          },
          buildWhen: (previous, current) =>
              current is TestPageInitialState || current is TestPageLoadedState,
          builder: (_, state) => Text(
            (state is TestPageLoadedState)
                ? state.message
                : 'Thinh Flutter Template',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
