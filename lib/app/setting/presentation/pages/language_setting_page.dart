import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mi_learning/app/setting/presentation/providers/language_setting_page_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/languages.dart';
import 'package:mi_learning/generated/locale_keys.g.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

import '../../../../config/styles.dart';

class LanguageSettingPage
    extends PageLoadingStateless<LanguageSettingPageProvider> {
  @override
  Widget buildPage(BuildContext context) {
    provider.isVietnamese = context.locale.toString() == 'vi';
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
          tr(LocaleKeys.pages_settings_language),
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: AppStyles.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              provider.isVietnamese = true;
              context.setLocale(Languages.supportedLocales[0]);
            },
            title: Text(tr(LocaleKeys.pages_settings_vi)),
            trailing: Selector<LanguageSettingPageProvider, bool>(
              selector: (_, provider) => provider.isVietnamese,
              builder: (context, value, child) => value
                  ? Icon(
                      Icons.check,
                      color: AppColors.primaryDark,
                    )
                  : SizedBox(),
            ),
          ),
          ListTile(
            title: Text('English'),
            onTap: () {
              provider.isVietnamese = false;
              context.setLocale(Languages.supportedLocales[1]);
            },
            trailing: Selector<LanguageSettingPageProvider, bool>(
              selector: (_, provider) => provider.isVietnamese,
              builder: (context, value, child) => !value
                  ? Icon(
                      Icons.check,
                      color: AppColors.primaryDark,
                    )
                  : SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
