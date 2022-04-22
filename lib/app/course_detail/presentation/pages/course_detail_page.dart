import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_back_button.dart';
import 'package:mi_learning/app/course_detail/presentation/providers/course_detail_provider.dart';
import 'package:mi_learning/app/course_detail/presentation/widgets/expandable_text.dart';
import 'package:mi_learning/app/dashboard/presentation/widgets/course_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/config/values.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

// class CourseDetailPage extends PageLoadingStateless<CourseDetailProvider> {
//   late final int id;
//   CourseDetailPage({Key? key}) : super(key: key);

//   @override
//   Widget buildPage(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(context),
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//               top: AppDimens.largeHeightDimens,
//             ),
//             child: Row(
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: AppDimens.largeWidthDimens,
//                     ),
//                     width: (1 / 2).sw,
//                     height: (1 / 3).sh,
//                     color: Colors.blue,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Flutter course for beginner',
//                           style: context.textTheme.titleLarge,
//                         ),
//                         SizedBox(height: AppDimens.mediumHeightDimens),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.people),
//                                 Text('1823'),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(Icons.star),
//                                 Text('4.5'),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: AppDimens.mediumHeightDimens),
//                         Text(
//                           '50 \$',
//                           style: context.textTheme.headline4?.copyWith(
//                             fontWeight: AppStyles.extraBold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     color: Colors.red,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: AppDimens.mediumWidthDimens,
//                     ),
//                     width: (1 / 2).sw,
//                     height: (1 / 3).sh,
//                     // transform: Matrix4.translationValues(0, 30.h, 0),
//                     child: SvgPicture.asset(
//                       'assets/images/education.svg',
//                       alignment: Alignment.topCenter,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           DraggableScrollableSheet(
//             controller: DraggableScrollableController(),
//             initialChildSize: 0.6,
//             maxChildSize: 0.9,
//             minChildSize: 0.6,
//             builder: (context, scrollController) => Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppDimens.largeWidthDimens,
//                 vertical: AppDimens.largeHeightDimens,
//               ),
//               decoration: BoxDecoration(
//                 color: context.isDarkMode
//                     ? AppColors.neutral.shade800
//                     : AppColors.neutral.shade50,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50.r),
//                   topRight: Radius.circular(50.r),
//                 ),
//               ),
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 controller: scrollController,
//                 shrinkWrap: true,
//                 itemBuilder: (_, index) => Text('Hello world $index'),
//                 itemCount: 100,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   AppBar _buildAppBar(BuildContext context) {
//     return AppBar(
//       centerTitle: true,
//       elevation: AppDimens.smallElevation,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios_rounded,
//           color: context.isDarkMode
//               ? AppColors.neutral.shade50
//               : AppColors.neutral.shade900,
//         ),
//         onPressed: () {},
//       ),
//       title: Text(
//         'Flutter course',
//         style: context.textTheme.titleLarge?.copyWith(),
//       ),
//       actions: [
//         StatefulBuilder(
//           builder: (_, setState) => IconButton(
//             onPressed: () {
//               setState(() {});
//             },
//             icon: Icon(
//               Random().nextBool()
//                   ? Icons.bookmark_rounded
//                   : Icons.bookmark_border_rounded,
//               color: AppColors.neutral.shade900,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   void initialization(BuildContext context) {
//     id = context.getArgument<int>() ?? 0;
//   }
// }

class CourseDetailPage extends PageLoadingStateless<CourseDetailProvider> {
  late final int id;
  CourseDetailPage({Key? key}) : super(key: key);
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.largeWidthDimens),
        child: Column(children: [
          Hero(
            tag: id,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.largeRadius),
              ),
              child: Image.asset('assets/images/flutter-course.jpeg'),
              elevation: AppDimens.largeElevation,
              clipBehavior: Clip.hardEdge,
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Text(
            'Flutter TDD Clean Architecture Course - Reso coder',
            style: context.textTheme.titleLarge,
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.play_circle_outline_outlined),
                  SizedBox(width: AppDimens.smallWidthDimens),
                  Text(
                    '12 Lessions',
                    style: context.textTheme.subtitle2,
                  ),
                ],
              ),
              SizedBox(width: AppDimens.largeWidthDimens),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined),
                  SizedBox(width: AppDimens.smallWidthDimens),
                  Text(
                    '23 hours',
                    style: context.textTheme.subtitle2,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: AppDimens.smallHeightDimens),
          ExpandableText(
            text:
                "Keeping your code clean and tested are the two most important development practices. In Flutter, this is even more true than with other frameworks. On one hand, it's nice to hack a quick app together, on the other hand, larger projects start falling apart when you mix the business logic everywhere. Even state management patterns like BLoC are not sufficient in themselves to allow for easily extendable codebase.",
            maxLines: 3,
            textStyle: context.textTheme.subtitle1,
            showTextStyle: context.textTheme.caption?.copyWith(
              fontWeight: AppStyles.extraBold,
              color: AppColors.primarySwatch.shade500,
            ),
          ),
          SizedBox(height: AppDimens.largeHeightDimens),
          ListTile(
            leading: const CircleAvatar(
              foregroundImage: AssetImage(
                'assets/images/avatar.jpg',
              ),
            ),
            tileColor: AppColors.neutral.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimens.mediumRadius,
              ),
            ),
            title: const Text('Reso coder'),
            subtitle: const Text('Senior Flutter Developer'),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: () {},
            ),
          ),
          //   Container(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: AppDimens.largeWidthDimens,
          //       vertical: AppDimens.mediumHeightDimens,
          //     ),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text('Detail'),
          //         VerticalDivider(
          //           color: AppColors.neutral.shade900,
          //           width: 20.0,
          //         ),
          //         Text('Detail'),
          //         VerticalDivider(
          //           color: AppColors.neutral.shade900,
          //           width: 20.0,
          //         ),
          //         Text('Detail'),
          //       ],
          //     ),
          //   ),
          // ],
        ]),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: AppDimens.smallElevation,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: context.isDarkMode
              ? AppColors.neutral.shade50
              : AppColors.neutral.shade900,
        ),
        onPressed: () => navigator.pop(),
      ),
      title: Text(
        'Flutter course',
        style: context.textTheme.titleLarge?.copyWith(),
      ),
      actions: [
        StatefulBuilder(
          builder: (_, setState) => IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Random().nextBool()
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: AppColors.neutral.shade900,
            ),
          ),
        )
      ],
    );
  }

  @override
  void initialization(BuildContext context) {
    id = context.getArgument<int>() ?? 0;
  }
}
