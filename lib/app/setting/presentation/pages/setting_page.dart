import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/setting/domain/entities/setting.dart';
import 'package:mi_learning/app/setting/presentation/providers/setting_page_provider.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class SettingPage extends PageLoadingStateless<SettingPageProvider> {
  Map<String, List<Setting>> getSettings(BuildContext context) => {
        tr(LocaleKeys.pages_settings_account): [
          Setting(
            title: tr(LocaleKeys.pages_settings_edit_profile),
            onPressed: () => navigator
                .pushNamed(
              Routes.editProfile,
              arguments: provider.userInfo,
            )
                .then((value) async {
              if (value is bool && value == true) {
                showLoading(context, true);
                await provider.getUserInfo();
                showLoading(context, false);
              }
            }),
            isSwitch: false,
          ),
          Setting(
            title: tr(LocaleKeys.pages_settings_change_password),
            onPressed: () {
              context.navigator.pushNamed(Routes.changePassword);
            },
            isSwitch: false,
          ),
        ],
        tr(LocaleKeys.pages_settings_preferences): [
          Setting(
            title: tr(LocaleKeys.pages_settings_language),
            subtitle:
                context.locale.toString() == 'vi' ? "Vietnamese" : "English",
            onPressed: () {
              navigator.pushNamed(Routes.languageSetting);
            },
            isSwitch: false,
          ),
          Setting(
            title: tr(LocaleKeys.pages_settings_saved_courses),
            onPressed: () => context.navigator.pushNamed(Routes.savedCourses),
            isSwitch: false,
          ),
        ],
        tr(LocaleKeys.pages_settings_misc): [
          Setting(
            title: tr(LocaleKeys.pages_settings_feedback),
            subtitle: tr(LocaleKeys.pages_settings_tell_us_what_happended),
            onPressed: () => navigator.pushNamed(Routes.feedback),
            isSwitch: false,
          ),
          Setting(
            title: tr(LocaleKeys.pages_settings_app_version),
            onPressed: () {},
            subtitle: 'v1.0.0',
          ),
        ],
      };

  @override
  Widget buildPage(BuildContext context) {
    final settings = getSettings(context);
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
          tr(LocaleKeys.pages_settings_settings),
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
            GestureDetector(
              onTap: () async {
                final file = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                );
                final path = file?.files.single.path;

                showLoading(context, true);
                if (path != null) {
                  final result = await provider.updateUserAvatar(
                    File(path),
                    provider.userInfo?.id ?? "",
                  );

                  showLoading(context, false);

                  result.fold(
                    (l) => provider.showDialog(
                      context,
                      WDialog(
                        dialogType: DialogType.error,
                        content: l.message,
                        onActions: const [],
                      ),
                    ),
                    (r) => {},
                  );
                }
              },
              child: Selector<SettingPageProvider, String>(
                selector: (_, provider) => provider.userInfo?.avatar ?? "",
                builder: (_, avatar, child) => Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: NetworkImage(avatar),
                  ),
                ),
              ),
            ),
            SizedBox(height: AppDimens.largeHeightDimens),
            Align(
              alignment: Alignment.center,
              child: Selector<SettingPageProvider, String>(
                selector: (context, provider) => provider.userInfo?.name ?? "",
                builder: (context, name, child) => Text(
                  name,
                  style: context.textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(height: AppDimens.mediumHeightDimens),
            Align(
              alignment: Alignment.center,
              child: Selector<SettingPageProvider, String>(
                selector: (_, provider) => provider.userInfo?.occupation ?? "",
                builder: (_, occupation, child) => Text(
                  occupation,
                  style: context.textTheme.subtitle1,
                ),
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
                              onTap: setting.onPressed,
                              title: Text(setting.title),
                              subtitle: setting.subtitle != null
                                  ? Text(setting.subtitle ?? "")
                                  : null,
                              trailing: setting.isSwitch == null
                                  ? null
                                  : setting.isSwitch!
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
                onPressed: () async {
                  final result = await provider.signOut();
                  result.fold((l) => null, (result) {
                    navigator.pushReplacementNamed(
                      Routes.landing,
                    );
                  });
                },
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
  void afterFirstBuild(BuildContext context) {
    provider.userInfo = context.getArgument<BasicUserInfo>();
    super.afterFirstBuild(context);
  }
}
