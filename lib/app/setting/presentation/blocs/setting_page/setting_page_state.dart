part of 'setting_page_bloc.dart';

abstract class SettingPageState extends Equatable {
  const SettingPageState();

  @override
  List<Object> get props => [];
}

class SettingPageInitial extends SettingPageState {}

class SettingPageLoadingState extends SettingPageState {}

class SettingPageLoggedOutState extends SettingPageState {}
