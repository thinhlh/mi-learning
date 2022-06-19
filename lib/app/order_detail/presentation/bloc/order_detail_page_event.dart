part of 'order_detail_page_bloc.dart';

abstract class OrderDetailPageEvent extends Equatable {
  const OrderDetailPageEvent();

  @override
  List<Object> get props => [];
}

class OrderDetailPageChangePaymentMethodEvent extends OrderDetailPageEvent {
  final int paymentMethod;

  const OrderDetailPageChangePaymentMethodEvent({required this.paymentMethod});
}

class OrderDetailPageGetUserBasicInfo extends OrderDetailPageEvent {}

class OrderDetailPageCheckoutEvent extends OrderDetailPageEvent {
  final Course course;

  OrderDetailPageCheckoutEvent({required this.course});
}
