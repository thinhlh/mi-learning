import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/order_detail/domain/usecases/checkout_usecase.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

part 'order_detail_page_event.dart';
part 'order_detail_page_state.dart';

class OrderDetailPageBloc
    extends Bloc<OrderDetailPageEvent, OrderDetailPageState> {
  final GetBasicUserInfoUseCase _getBasicUserInfoUseCase;
  final CheckoutUseCase _checkoutUseCase;

  OrderDetailPageBloc(
    this._getBasicUserInfoUseCase,
    this._checkoutUseCase,
  ) : super(OrderDetailPageInitialState(paymentMethod: 0)) {
    on<OrderDetailPageChangePaymentMethodEvent>((event, emit) {
      if (state is OrderDetailPageLoadedState) {
        emit(
          (state as OrderDetailPageLoadedState)
              .copyWith(paymentMethod: event.paymentMethod),
        );
      } else {
        emit(OrderDetailPageInitialState(paymentMethod: event.paymentMethod));
      }
    });

    on<OrderDetailPageGetUserBasicInfo>(
      (event, emit) async {
        final currentState = state;
        emit(OrderDetailPageLoadingState());

        final result = await _getBasicUserInfoUseCase(NoParams());

        result.fold(
          (failure) => emit(
            OrderDetailPageFailedState(message: failure.message),
          ),
          (userInfo) => emit(
            OrderDetailPageLoadedState(
              userInfo: userInfo,
              paymentMethod:
                  (currentState as OrderDetailPageInitialState).paymentMethod,
            ),
          ),
        );
      },
    );

    on<OrderDetailPageCheckoutEvent>(
      (event, emit) async {
        emit(OrderDetailPageLoadingState());

        final result = await _checkoutUseCase(
          CheckoutParams(course: event.course),
        );
        await Future.delayed(const Duration(seconds: 3));

        result.fold(
          (failure) => (failure) => emit(
                OrderDetailPageFailedState(message: failure.message),
              ),
          (result) => result
              ? emit(OrderDetailPageSuccessState())
              : emit(
                  const OrderDetailPageFailedState(
                    message: 'Unable to checkout',
                  ),
                ),
        );
      },
    );
  }

  void changePaymentMethos(int paymentMethod) {
    add(OrderDetailPageChangePaymentMethodEvent(paymentMethod: paymentMethod));
  }

  void getBasicUserInfo() {
    add(OrderDetailPageGetUserBasicInfo());
  }

  void checkout(Course course) {
    add(OrderDetailPageCheckoutEvent(course: course));
  }
}
