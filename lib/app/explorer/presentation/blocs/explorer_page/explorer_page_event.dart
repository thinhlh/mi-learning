part of 'explorer_page_bloc.dart';

abstract class ExplorerPageEvent extends Equatable {
  const ExplorerPageEvent();

  @override
  List<Object> get props => [];
}

class ExplorerPageGetExplorerCoursesEvent extends ExplorerPageEvent {}
