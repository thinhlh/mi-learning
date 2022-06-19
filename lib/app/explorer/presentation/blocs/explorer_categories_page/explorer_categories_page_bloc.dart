import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/explorer/domain/usecases/get_categories_use_case.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'explorer_categories_page_event.dart';
part 'explorer_categories_page_state.dart';

class ExplorerCategoriesPageBloc
    extends Bloc<ExplorerCategoriesPageEvent, ExplorerCategoriesPageState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  ExplorerCategoriesPageBloc(this._getCategoriesUseCase)
      : super(ExplorerCategoriesPageInitialState()) {
    on<ExplorerCategoriesGetCategoriesEvent>((event, emit) async {
      emit(ExplorerCategoriesPageLoadingState());

      final result = await _getCategoriesUseCase(NoParams());

      emit(result.fold(
        (failure) =>
            ExplorerCategoriesPageFailedState(message: failure.message),
        (categories) =>
            ExplorerCategoriesPageLoadedState(categories: categories),
      ));
    });
  }

  void getCategories() {
    add(ExplorerCategoriesGetCategoriesEvent());
  }
}
