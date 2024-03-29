import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mi_learning/config/themes.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/languages.dart';
import 'package:mi_learning/config/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: Languages.supportedLocales,
      path: 'assets/translations',
      fallbackLocale: Languages.fallbackLocale,
      child: ScreenUtilInit(
        designSize: AppDimens.designSize,
        builder: (ctx, child) => Builder(
          builder: (context) {
            return MaterialApp(
              navigatorObservers: [Routes.routeObserver],
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              initialRoute: Routes.initial,
              onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
              themeMode: ThemeMode.system,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              builder: (ctx, child) => ResponsiveWrapper.builder(
                child,
                defaultScale: true,
                maxWidth: 2460,
                minWidth: 350,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(350, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(600, name: TABLET),
                  ResponsiveBreakpoint.resize(800, name: DESKTOP),
                  ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
