part of 'test_page_bloc.dart';

abstract class TestPageEvent extends Equatable {
  const TestPageEvent();

  @override
  List<Object> get props => [];
}

class TestPageCheckConnectionEvent extends TestPageEvent {}
