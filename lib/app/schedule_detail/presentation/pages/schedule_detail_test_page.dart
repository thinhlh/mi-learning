import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/schedule_detail/presentation/providers/schedule_detail_test_page_provider.dart';
import 'package:mi_learning/app/schedule_detail/presentation/widgets/question_widget.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';

class ScheduleDetailTestPage
    extends PageLoadingStateless<ScheduleDetailTestPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.black,
      //   ),
      // ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h, top: 40.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: title()),
              image(),
              quiz(),
            ]),
      ),
    );
  }

  Widget title() {
    return const Text(
      'What is the capital of America?',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget image() {
    return Image.asset('assets/images/quiz.png');
  }

  Widget quiz() {
    return SizedBox(
      height: 420.h,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10.h,
        mainAxisSpacing: 10.w,
        children: const [
          // SizedBox(),
          QuestionWidget(
            question: 'HaNoi',
            icon: 'assets/images/triangle.png',
            color: Colors.red,
          ),
          QuestionWidget(
            question: 'Washinton D.C',
            icon: 'assets/images/rhombus.png',
            color: Colors.blue,
          ),

          QuestionWidget(
            question: 'Chicago',
            icon: 'assets/images/circle.png',
            color: Colors.yellow,
          ),
          QuestionWidget(
            question: 'Los Angeles',
            icon: 'assets/images/square.png',
            color: Colors.green,
          ),

          // Icon(
          //   Icons.,
          //   color: Colors.green,
          // ),
        ],
      ),
    );
  }
}
