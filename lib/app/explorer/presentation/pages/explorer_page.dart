import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:mi_learning/app/common/domain/entity/category.dart';
import 'package:mi_learning/app/common/domain/entity/course.dart';
import 'package:mi_learning/app/explorer/presentation/providers/explorer_page_provider.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_category_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_large_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_medium_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_small_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_square_widget.dart';
import 'package:mi_learning/app/explorer/presentation/widgets/course_top_chart_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/base/presentation/pages/p_stateful.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:mi_learning/utils/route_util.dart';
import 'package:provider/provider.dart';

part 'explorer_tab_page.dart';
part 'explorer_for_you_page.dart';
part 'explorer_top_chart_page.dart';
part 'explorer_categories_page.dart';
part 'explorer_editor_choice_page.dart';
part 'explorer_premium_page.dart';
part 'explorer_free_page.dart';

class ExplorerPage extends PageLoadingStateless<ExplorerPageProvider> {
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
                hintText: 'Search for apps & games',
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
  void initialization(BuildContext context) {
    provider.getCourses();
  }
}
