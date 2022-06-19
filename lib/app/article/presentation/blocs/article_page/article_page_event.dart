part of 'article_page_bloc.dart';

abstract class ArticlePageEvent extends Equatable {
  const ArticlePageEvent();

  @override
  List<Object> get props => [];
}

class ArticlePageLoadArticlesEvent extends ArticlePageEvent {}
