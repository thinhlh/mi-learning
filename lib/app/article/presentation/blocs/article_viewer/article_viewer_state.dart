part of 'article_viewer_bloc.dart';

abstract class ArticleViewerState extends Equatable {
  const ArticleViewerState();
  
  @override
  List<Object> get props => [];
}

class ArticleViewerInitial extends ArticleViewerState {}
