import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/helper/build_error_bar.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/home_view.dart';
import 'package:fruits_e_commerce/features/login/logic/login_cubit.dart';
import 'package:fruits_e_commerce/features/login/widgets/custom_porgress_hud.dart';
import 'package:fruits_e_commerce/features/login/widgets/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
