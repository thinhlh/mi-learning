import 'package:flutter/material.dart';
import 'package:mi_learning/app/auth/presentation/provider/auth_provider.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';

class AuthPage extends PageLoadingStateful<AuthProvider> {
  @override
  State<StatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends PageLoadingState<AuthProvider> {
  @override
  Widget buildPage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.neutral_300,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: TabBar(
            controller: TabController(length: 2, vsync: this),
            tabs: [
              Tab(
                text: '123',
              ),
              Tab(
                text: '123',
              )
            ],
          ),
        ),
        _buildForm(true, context),
        ElevatedButton(
          onPressed: () {},
          child: Text('Sign In'),
        ),
        _buildSocialLogin(),
      ],
    );
  }

  Widget _buildForm(bool isSignIn, BuildContext context) {
    return Text(
      'Welcome Back',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildSocialLogin() {
    return Container();
  }

  @override
  void initialization(BuildContext context) {}
}
