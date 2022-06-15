import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_page_provider.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/config/routes.dart';
import 'package:mi_learning/config/styles.dart';
import 'package:mi_learning/services/dialogs/app_loading.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends PageLoadingStateful<AuthPageProvider, AuthPage>
    with TickerProviderStateMixin {
  @override
  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.extraLargeWidthDimens,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _AuthPageHeader(),
            _AuthPageForm(),
            // _AuthPageSocialLogin()
          ],
        ),
      ),
    );
  }

  @override
  void initialization(BuildContext context) {}
}

class _AuthPageForm extends StatelessWidget {
  const _AuthPageForm({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthPageProvider>();

    return Selector<AuthPageProvider, bool>(
      selector: (_, provider) => provider.isLogin,
      shouldRebuild: (previous, next) => previous != next,
      child: const _AuthPageEmailPasswordTextFields(),
      builder: (_, isLogin, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              isLogin ? "Welcome back" : 'Welcome to Mi Learning',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: AppStyles.bold,
                  ),
            ),
          ),
          SizedBox(height: AppDimens.mediumHeightDimens),
          Text(
            isLogin
                ? 'Did you enjoy your day?'
                : 'Shall we know about each other a little bit?',
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          child!,
          Visibility(
            visible: !isLogin,
            child: const _AuthPageSignUpForm(),
          ),
          SizedBox(height: isLogin ? AppDimens.largeHeightDimens : 0),
          Visibility(
            visible: isLogin,
            child: GestureDetector(
              onTap: () => context.navigator.pushNamed(Routes.forgotPassword),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password',
                  style: context.textTheme.titleMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.textDisable,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                AppLoading.showLoading(context);
                final result =
                    await (isLogin ? provider.signIn() : provider.signUp());
                AppLoading.dismissLoading(context);
                result.fold(
                  (failure) => showDialog(
                    context: context,
                    builder: (context) => WDialog(
                      dialogType: DialogType.error,
                      content: failure.message,
                      onActions: [],
                    ),
                  ),
                  (emailVerified) {
                    if (isLogin) {
                      // if (emailVerified) {
                      context.navigator.pushNamed(Routes.home);
                      // } else {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => WDialog(
                      //       dialogType: DialogType.info,
                      //       content:
                      //           'Please verify your email address before login!',
                      //       onActions: [],
                      //     ),
                      //   );
                      // }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => WDialog(
                          dialogType: DialogType.success,
                          content: 'Register success!',
                          onActions: [],
                        ),
                      );

                      provider.goToSignIn();
                    }
                  },
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(vertical: 24),
                ),
              ),
              child: Text(
                isLogin ? 'Sign In' : 'Sign Up',
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.neutral.shade50,
                  fontWeight: AppStyles.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: AppDimens.extraLargeHeightDimens),
        ],
      ),
    );
  }
}

class _AuthPageSignUpForm extends StatelessWidget {
  const _AuthPageSignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthPageProvider provider = context.read<AuthPageProvider>();
    return Column(
      children: [
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 're-enter password',
          controller: provider.reEnterPasswordController,
          inputType: TextInputType.visiblePassword,
          obsercureText: true,
          icon: Icons.vpn_key_outlined,
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 'name',
          controller: provider.nameController,
          inputType: TextInputType.name,
          icon: Icons.person_outline,
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 'occupation',
          controller: provider.occupationController,
          inputType: TextInputType.text,
          icon: Icons.work_outline_rounded,
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select your role',
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: AppStyles.bold,
            ),
          ),
        ),
        SizedBox(height: AppDimens.largeHeightDimens),
        Container(
          decoration: BoxDecoration(
            color: AppColors.neutral.shade50,
            borderRadius: BorderRadius.circular(
              AppDimens.largeRadius,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.largeWidthDimens,
            vertical: AppDimens.mediumHeightDimens,
          ),
          child: Selector<AuthPageProvider, String?>(
            selector: (_, provider) => provider.role,
            builder: (_, roleValue, child) => DropdownButton<String>(
              underline: const SizedBox(),
              value: roleValue,
              isExpanded: true,
              dropdownColor: AppColors.neutral.shade50,
              hint: Text(
                'Role defines how you can use our application',
                style: context.textTheme.labelLarge?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              items: const <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('Student'),
                  value: 'Student',
                ),
                DropdownMenuItem(
                  child: Text('Teacher'),
                  value: 'Teacher',
                ),
              ],
              onChanged: (value) {
                provider.role = value;
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthPageEmailPasswordTextFields extends StatelessWidget {
  const _AuthPageEmailPasswordTextFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthPageProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WidgetTextField(
          label: 'email',
          controller: provider.emailController,
          inputType: TextInputType.emailAddress,
          icon: Icons.email_outlined,
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 'password',
          controller: provider.passwordController,
          inputType: TextInputType.visiblePassword,
          obsercureText: true,
          icon: Icons.vpn_key_outlined,
        ),
      ],
    );
  }
}

class _AuthPageSocialLogin extends StatelessWidget {
  const _AuthPageSocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.extraLargeWidthDimens,
          ),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: AppColors.neutral.shade900,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Text(
                  'Or continue with',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.neutral.shade600,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                color: AppColors.neutral.shade900,
              )),
            ],
          ),
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        GridView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppDimens.largeWidthDimens,
            childAspectRatio: 3,
          ),
          children: [
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.extraLargeRadius,
                    ),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 30.r,
                    color: Colors.blue,
                  ),
                  SizedBox(width: AppDimens.largeWidthDimens),
                  Text(
                    'Google',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            OutlinedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppDimens.extraLargeRadius,
                    ),
                  ),
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    './assets/images/google.svg',
                    width: 30.r,
                  ),
                  SizedBox(width: AppDimens.largeWidthDimens),
                  Text(
                    'Google',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _AuthPageHeader extends StatelessWidget {
  const _AuthPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthPageProvider>();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral.shade300,
        borderRadius: BorderRadius.circular(AppDimens.largeRadius),
      ),
      margin: EdgeInsets.symmetric(
        vertical: AppDimens.extraLargeHeightDimens,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppDimens.smallHeightDimens,
          horizontal: AppDimens.mediumWidthDimens,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => provider.goToSignIn(),
                child: Selector<AuthPageProvider, bool>(
                  shouldRebuild: ((previous, next) => previous != next),
                  selector: (_, provider) => provider.isLogin,
                  builder: (_, isLogin, child) => Container(
                    padding: EdgeInsets.symmetric(
                      vertical: isLogin ? 10.h : 0.0,
                    ),
                    decoration: isLogin
                        ? BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius:
                                BorderRadius.circular(AppDimens.largeRadius),
                          )
                        : null,
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: isLogin ? null : AppColors.textSecondary,
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => provider.goToSignUp(),
                child: Selector<AuthPageProvider, bool>(
                  selector: (_, provider) => provider.isLogin,
                  builder: (_, isLogin, child) => Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: isLogin ? 0.0 : 10.h,
                    ),
                    decoration: !isLogin
                        ? BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius:
                                BorderRadius.circular(AppDimens.largeRadius),
                          )
                        : null,
                    child: Text(
                      'Sign Up',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: isLogin ? AppColors.textSecondary : null,
                        fontWeight: AppStyles.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
