part of 'dashboard_page_bloc.dart';

abstract class DashboardPageState extends Equatable {
  const DashboardPageState();

  @override
  List<Object> get props => [];
}

class DashboardPageInitialState extends DashboardPageState {}

class DashboardPageLoadingState extends DashboardPageState {}

class DashboardPageLoadedState extends DashboardPageState {
  final BasicUserInfo userInfo;
  final List<MyCourse> myCourses;
  final List<RecommendedCourse> recommendationCourses;

  DashboardPageLoadedState({
    required this.userInfo,
    required this.myCourses,
    required this.recommendationCourses,
  });

  @override
  List<Object> get props => [userInfo, myCourses, recommendationCourses];
}

class DashboardPageFailedState extends DashboardPageState {
  final String message;

  DashboardPageFailedState({required this.message});

  @override
  List<Object> get props => [message];
}
