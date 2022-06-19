part of 'explorer_page_bloc.dart';

abstract class ExplorerPageState extends Equatable {
  const ExplorerPageState();

  @override
  List<Object> get props => [];
}

class ExplorerPageInitialState extends ExplorerPageState {}

class ExplorerPageLoadingState extends ExplorerPageState {}

class ExplorerPageLoadedState extends ExplorerPageState {
  final List<Course> courses;

  ExplorerPageLoadedState({required this.courses});
}

class ExplorerPageFailedState extends ExplorerPageState {
  final String message;

  ExplorerPageFailedState({required this.message});
}
