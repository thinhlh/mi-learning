import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteUtil {
  RouteUtil._internal();

  static Widget createPageBloc<T extends Bloc>({
    required T Function(BuildContext) bloc,
    required Widget child,
  }) {
    return BlocProvider<T>(
      child: child,
      create: bloc,
      lazy: true,
    );
  }
}
