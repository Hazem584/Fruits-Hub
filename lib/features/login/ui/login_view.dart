import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/app_bar.dart';
import 'package:fruits_e_commerce/features/login/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'تسجيل دخول', context: context),
      body: LoginViewBody(),
    );
  }
}
