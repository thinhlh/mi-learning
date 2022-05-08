import 'package:flutter/material.dart';

class RouteArguments {
  final ChangeNotifier provider;
  final Widget page;

  const RouteArguments({
    required this.provider,
    required this.page,
  });
}
