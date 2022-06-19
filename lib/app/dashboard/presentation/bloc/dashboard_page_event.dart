part of 'dashboard_page_bloc.dart';

abstract class DashboardPageEvent extends Equatable {
  const DashboardPageEvent();

  @override
  List<Object> get props => [];
}

class DashboardPageGetDataEvent extends DashboardPageEvent {}
