import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_page_event.dart';
part 'payment_page_state.dart';

class PaymentPageBloc extends Bloc<PaymentPageEvent, PaymentPageState> {
  PaymentPageBloc() : super(PaymentPageInitial()) {
    on<PaymentPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
