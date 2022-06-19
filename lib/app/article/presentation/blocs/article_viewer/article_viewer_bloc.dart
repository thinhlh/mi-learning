import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_viewer_event.dart';
part 'article_viewer_state.dart';

class ArticleViewerBloc extends Bloc<ArticleViewerEvent, ArticleViewerState> {
  ArticleViewerBloc() : super(ArticleViewerInitial()) {
    on<ArticleViewerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
