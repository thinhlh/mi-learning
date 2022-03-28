import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends PageLoadingStateful<AuthProvider, AuthPage>
    with TickerProviderStateMixin {
  @override
  Widget buildPage(BuildContext context) {
    print('Built auth');

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.extraLargeWidthDimens,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildForm(context),
            SizedBox(height: AppDimens.extraLargeHeightDimens),
            _buildSocialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutral_300,
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
              child: GestureDetector(
                onTap: () => provider.goToSignIn(),
                child: Selector<AuthProvider, bool>(
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => provider.goToSignUp(),
                child: Selector<AuthProvider, bool>(
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
                        fontWeight: FontWeight.bold,
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

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back,',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(height: AppDimens.mediumHeightDimens),
        Text(
          'Good to see you again',
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 'email',
          controller: provider.emailController,
          inputType: TextInputType.emailAddress,
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        WidgetTextField(
          label: 'password',
          controller: provider.passwordController,
          inputType: TextInputType.visiblePassword,
          obsercureText: true,
        ),
        SizedBox(height: AppDimens.largeHeightDimens),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot password',
            style: context.textTheme.titleMedium?.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.textDisable,
            ),
          ),
        ),
        SizedBox(height: AppDimens.extraLargeHeightDimens),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => provider.signIn(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 24),
              ),
            ),
            child: Text(
              'Sign In',
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.neutral_50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.extraLargeWidthDimens,
          ),
          child: Row(
            children: [
              const Expanded(
                child: Divider(
                  color: AppColors.neutral_900,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.largeWidthDimens,
                ),
                child: Text(
                  'Or continue with',
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.neutral_600,
                  ),
                ),
              ),
              const Expanded(
                  child: Divider(
                color: AppColors.neutral_900,
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

  @override
  void initialization(BuildContext context) {}
}
