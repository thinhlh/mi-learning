import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';
import 'package:mi_learning/base/failure.dart';

part 'dashboard_page_event.dart';
part 'dashboard_page_state.dart';

class DashboardPageBloc extends Bloc<DashboardPageEvent, DashboardPageState> {
  final GetBasicUserInfoUseCase _getBasicUserInfoUseCase;
  final GetMyCoursesUseCase _getMyCoursesUseCase;
  final GetRecommendedCourseUseCase _getRecommendedCourseUseCase;

  DashboardPageBloc(
    this._getBasicUserInfoUseCase,
    this._getMyCoursesUseCase,
    this._getRecommendedCourseUseCase,
  ) : super(DashboardPageInitialState()) {
    on<DashboardPageGetDataEvent>((event, emit) async {
      emit(DashboardPageLoadingState());

      final basicUserInfo = await _getBasicUserInfoUseCase(NoParams());

      basicUserInfo.fold((l) => DashboardPageFailedState(message: l.message),
          (userInfo) async {
        final myCourses = await _getMyCoursesUseCase(NoParams());

        myCourses.fold((l) => DashboardPageFailedState(message: l.message),
            (myCourses) async {
          final reccomendedCourses =
              await _getRecommendedCourseUseCase(NoParams());

          reccomendedCourses.fold(
            (l) => DashboardPageFailedState(message: l.message),
            (recommendationCourses) => DashboardPageLoadedState(
              userInfo: userInfo,
              myCourses: myCourses,
              recommendationCourses: recommendationCourses,
            ),
          );
        });
      });
    });
  }

  void loadData() {
    add(DashboardPageGetDataEvent());
  }
}
