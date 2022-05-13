import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class SettingPage extends PageLoadingStateless<SettingProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          color: context.isDarkMode
              ? AppColors.neutral.shade500
              : AppColors.neutral.shade900,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
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
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            Text(
              'Account',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Edit profile'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                  ListTile(
                    title: Text('Change password'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            Text(
              'Account',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Edit profile'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                  ListTile(
                    title: Text('Change password'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            Text(
              'Account',
              style: context.textTheme.titleMedium,
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppDimens.mediumRadius),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Edit profile'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                  ListTile(
                    title: Text('Change password'),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16.r,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
