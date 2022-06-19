part of 'landing_page_bloc.dart';

abstract class LandingPageEvent extends Equatable {
  const LandingPageEvent();

  @override
  List<Object> get props => [];
}

class LandingPageGoToAuthEvent extends LandingPageEvent {}

class LandingPageChangePageEvent extends LandingPageEvent {
  final int currentPage;

  LandingPageChangePageEvent({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
