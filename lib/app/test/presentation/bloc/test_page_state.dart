part of 'test_page_bloc.dart';

abstract class TestPageState extends Equatable {
  const TestPageState();

  @override
  List<Object> get props => [];
}

class TestPageInitialState extends TestPageState {}

class TestPageLoadingState extends TestPageState {}

class TestPageLoadedState extends TestPageState {
  final String message;

  TestPageLoadedState({required this.message});

  @override
  List<Object> get props => [message];
}

class TestPageFailedState extends TestPageState {
  final String message;

  TestPageFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
