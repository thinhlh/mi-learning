part of 'landing_page_bloc.dart';

class LandingPageState extends Equatable {
  Map<List<Tuple2<String, TextStyle?>>, String> landingPages(
    BuildContext context,
  ) =>
      {
        [
          Tuple2(
            'Welcome to ',
            context.textTheme.titleLarge,
          ),
          Tuple2(
            'Mi Learning',
            context.textTheme.titleLarge?.copyWith(
              fontSize: 22.sp,
              fontWeight: AppStyles.extraBold,
            ),
          ),
          Tuple2(
            '\nThe world largest E-Learning platform',
            context.textTheme.titleMedium?.copyWith(
              color: AppColors.neutral.shade600,
            ),
          )
        ]: "assets/images/online_learning.svg",
        [
          Tuple2(
            'Access to our resources from anywhere',
            context.textTheme.titleLarge,
          ),
          Tuple2(
            '\nMore than 1000+ courses from all teachers around the world.',
            context.textTheme.titleMedium?.copyWith(
              color: AppColors.neutral.shade600,
            ),
          )
        ]: "assets/images/online_learning_courses.svg",
        [
          Tuple2(
            'Achieve high scores though your tests.',
            context.textTheme.titleLarge,
          ),
          Tuple2(
            '\nStudent are always able to taking their test no matter which device they are using.',
            context.textTheme.titleMedium?.copyWith(
              color: AppColors.neutral.shade600,
            ),
          )
        ]: "assets/images/online_learning_test.svg",
        [
          Tuple2(
            'Gain your certificate!',
            context.textTheme.titleLarge,
          ),
          Tuple2(
            '\nCertification for completing the course are always available.',
            context.textTheme.titleMedium?.copyWith(
              color: AppColors.neutral.shade600,
            ),
          )
        ]: "assets/images/online_learning_certification.svg",
      };

  final int currentPage;
  const LandingPageState({required this.currentPage});

  @override
  List<Object> get props => [currentPage];
}
