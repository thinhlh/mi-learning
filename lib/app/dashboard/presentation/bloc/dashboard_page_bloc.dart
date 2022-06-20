import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mi_learning/app/dashboard/domain/entities/my_course.dart';
import 'package:mi_learning/app/dashboard/domain/entities/recommended_course.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_basic_user_info_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_my_courses_use_case.dart';
import 'package:mi_learning/app/dashboard/domain/usecases/get_recommended_courses_use_case.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/domain/usecase/params.dart';

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
    on<DashboardPageGetDataEvent>(
      (event, emit) async {
        emit(DashboardPageLoadingState());

        await _getBasicUserInfoUseCase(NoParams()).then(
          (value) => value.fold(
            (l) => emit(DashboardPageFailedState(message: l.message)),
            (userInfo) async {
              await _getMyCoursesUseCase(NoParams()).then(
                (value) => value.fold(
                  (l) => emit(DashboardPageFailedState(message: l.message)),
                  (myCourses) async {
                    await _getRecommendedCourseUseCase(NoParams()).then(
                      (value) => value.fold(
                        (l) =>
                            emit(DashboardPageFailedState(message: l.message)),
                        (recommendationCourses) async => emit(
                          DashboardPageLoadedState(
                            userInfo: userInfo,
                            myCourses: myCourses,
                            recommendationCourses: recommendationCourses,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );

        // basicUserInfo.fold(
        //   (l) async => emit(DashboardPageFailedState(message: l.message)),
        //   (userInfo) async {
        //     final myCourses = await _getMyCoursesUseCase(NoParams());

        //     myCourses.fold(
        //       (l) async => emit(DashboardPageFailedState(message: l.message)),
        //       (myCourses) async {
        //         final reccomendedCourses =
        //             await _getRecommendedCourseUseCase(NoParams());

        //         reccomendedCourses.fold(
        //           (l) async =>
        //               emit(DashboardPageFailedState(message: l.message)),
        //           (recommendationCourses) async => emit(
        //             DashboardPageLoadedState(
        //               userInfo: userInfo,
        //               myCourses: myCourses,
        //               recommendationCourses: recommendationCourses,
        //             ),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // );
      },
    );
  }

  void loadData() {
    add(DashboardPageGetDataEvent());
  }
}
