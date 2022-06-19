part of 'explorer_categories_page_bloc.dart';

abstract class ExplorerCategoriesPageState extends Equatable {
  const ExplorerCategoriesPageState();

  @override
  List<Object> get props => [];
}

class ExplorerCategoriesPageInitialState extends ExplorerCategoriesPageState {}

class ExplorerCategoriesPageLoadingState extends ExplorerCategoriesPageState {}

class ExplorerCategoriesPageFailedState extends ExplorerCategoriesPageState {
  final String message;

  ExplorerCategoriesPageFailedState({required this.message});

  @override
  List<Object> get props => [message];
}

class ExplorerCategoriesPageLoadedState extends ExplorerCategoriesPageState {
  final List<Category> categories;

  ExplorerCategoriesPageLoadedState({required this.categories});

  @override
  List<Object> get props => [categories];
}
