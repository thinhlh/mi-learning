import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class Setting {
  final String title;
  final String? subtitle;
  final void Function() onPressed;
  final bool isSwitch;

  Setting({
    required this.title,
    this.subtitle,
    required this.onPressed,
    required this.isSwitch,
  });
}

class SettingPage extends PageLoadingStateless<SettingPageProvider> {
  final Map<String, List<Setting>> settings = {
    "Account": [
      Setting(
        title: 'Edit profile',
        onPressed: () {},
        isSwitch: false,
      ),
      Setting(
        title: 'Change password',
        onPressed: () {},
        isSwitch: true,
      ),
    ],
    "Preferences": [
      Setting(
        title: 'Language',
        subtitle: 'Vietnamese',
        onPressed: () {},
        isSwitch: false,
      ),
      Setting(
        title: 'Saved Courses',
        onPressed: () {},
        isSwitch: true,
      ),
    ],
  };

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => navigator.pop(),
          color: context.isDarkMode
              ? AppColors.neutral.shade500
              : AppColors.neutral.shade900,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Settings',
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: AppStyles.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.largeWidthDimens,
          vertical: AppDimens.largeHeightDimens,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: const AssetImage(
                  'assets/images/avatar.jpg',
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Hoang Thinh',
                style: context.textTheme.titleLarge,
              ),
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Developer',
                style: context.textTheme.subtitle1,
              ),
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppDimens.largeHeightDimens),
              shrinkWrap: true,
              itemBuilder: (_, parentIndex) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    settings.keys.toList()[parentIndex],
                    style: context.textTheme.titleMedium,
                  ),
                  SizedBox(height: AppDimens.mediumHeightDimens),
                  Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                        height: 1.h,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final setting =
                            settings.values.toList()[parentIndex][index];

                        return Column(
                          children: [
                            ListTile(
                              title: Text(setting.title),
                              subtitle: setting.subtitle != null
                                  ? Text(setting.subtitle ?? "")
                                  : null,
                              trailing: setting.isSwitch
                                  ? Transform.scale(
                                      alignment: Alignment.centerRight,
                                      scaleY: 0.8,
                                      scaleX: 0.8,
                                      child: Switch.adaptive(
                                        activeColor: AppColors.tetiary,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    )
                                  : Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16.r,
                                    ),
                            ),
                          ],
                        );
                      },
                      itemCount: 2,
                    ),
                  ),
                ],
              ),
              itemCount: settings.length,
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => navigator.pushNamedAndRemoveUntil(
                  Routes.landing,
                  (route) => true,
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}
