part of 'order_detail_page_bloc.dart';

abstract class OrderDetailPageState extends Equatable {
  const OrderDetailPageState();

  @override
  List<Object> get props => [];
}

class OrderDetailPageInitialState extends OrderDetailPageState {
  final int paymentMethod;

  OrderDetailPageInitialState({required this.paymentMethod});
}

class OrderDetailPageLoadingState extends OrderDetailPageState {}

class OrderDetailPageLoadedState extends OrderDetailPageState {
  final BasicUserInfo userInfo;
  final int paymentMethod;

  OrderDetailPageLoadedState({
    required this.userInfo,
    required this.paymentMethod,
  });

  OrderDetailPageLoadedState copyWith({
    BasicUserInfo? userInfo,
    int? paymentMethod,
  }) =>
      OrderDetailPageLoadedState(
        userInfo: userInfo ?? this.userInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}

class OrderDetailPageSuccessState extends OrderDetailPageState {}

class OrderDetailPageFailedState extends OrderDetailPageState {
  final String message;

  const OrderDetailPageFailedState({required this.message});
}
