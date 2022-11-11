import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ButtonThemeData get buttonTheme => Theme.of(this).buttonTheme;

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;

  NavigatorState get navigator => Navigator.of(this);

  T? getArgument<T>() => ModalRoute.of(this)?.settings.arguments as T?;
}
