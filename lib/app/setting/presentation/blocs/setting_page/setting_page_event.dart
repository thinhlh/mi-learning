part of 'setting_page_bloc.dart';

abstract class SettingPageEvent extends Equatable {
  const SettingPageEvent();

  @override
  List<Object> get props => [];
}

class SettingPageSignOutEvent extends SettingPageEvent {}
