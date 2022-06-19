import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_editor_choice_page/explorer_editor_choice_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_for_you_page/explorer_for_you_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_free_page/explorer_free_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_page/explorer_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_premium_page/explorer_premium_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/blocs/explorer_top_chart_page/explorer_top_chart_page_bloc.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_category_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_large_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_medium_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_small_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_square_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_top_chart_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

part 'explorer_tab_page.dart';
part 'explorer_for_you_page.dart';
part 'explorer_top_chart_page.dart';
part 'explorer_categories_page.dart';
part 'explorer_editor_choice_page.dart';
part 'explorer_premium_page.dart';
part 'explorer_free_page.dart';

class ExplorerPage extends PageLoadingStateless<ExplorerPageBloc> {
  ExplorerPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.largeWidthDimens,
              vertical: AppDimens.largeHeightDimens,
            ),
            child: TextField(
              maxLines: 1,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: AppColors.primarySwatch.shade50.withOpacity(
                  0.3,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                hintText: 'Search for courses',
              ),
            ),
          ),
          const Expanded(
            child: _ExplorerTabPage(),
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstBuild(BuildContext context) {
    super.afterFirstBuild(context);
    bloc.getExplorerCourses();
  }
}
