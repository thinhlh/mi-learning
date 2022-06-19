import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(const LandingPageState(currentPage: 0)) {
    on<LandingPageEvent>((event, emit) {
      if (event is LandingPageChangePageEvent) {
        emit(LandingPageState(currentPage: state.currentPage + 1));
      }
    });
  }

  void goToNextPage(int page) {
    add(LandingPageChangePageEvent(currentPage: page));
  }
}
