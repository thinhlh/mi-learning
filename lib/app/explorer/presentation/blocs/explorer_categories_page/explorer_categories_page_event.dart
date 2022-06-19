part of 'explorer_categories_page_bloc.dart';

abstract class ExplorerCategoriesPageEvent extends Equatable {
  const ExplorerCategoriesPageEvent();

  @override
  List<Object> get props => [];
}

class ExplorerCategoriesGetCategoriesEvent extends ExplorerCategoriesPageEvent {
}
