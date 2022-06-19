part of 'article_page_bloc.dart';

abstract class ArticlePageState extends Equatable {
  const ArticlePageState();

  @override
  List<Object> get props => [];
}

class ArticlePageInitialState extends ArticlePageState {}

class ArticlePageLoadedState extends ArticlePageState {
  final Map<String, List<Article>> articles;

  ArticlePageLoadedState({required this.articles});

  @override
  List<Object> get props => [articles];
}

class ArticlePageLoadingState extends ArticlePageState {}
