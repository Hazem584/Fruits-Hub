import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/app_bar.dart';
import 'package:fruits_e_commerce/features/signup/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "حساب جديد"),
      body: SingleChildScrollView(
        child: SignupViewBody(),
      ),
      );
  }
}
