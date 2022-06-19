import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'explorer_top_chart_page_event.dart';
part 'explorer_top_chart_page_state.dart';

class ExplorerTopChartPageBloc
    extends Bloc<ExplorerTopChartPageEvent, ExplorerTopChartPageState> {
  ExplorerTopChartPageBloc() : super(ExplorerTopChartPageInitial()) {
    on<ExplorerTopChartPageEvent>((event, emit) {});
  }
}
