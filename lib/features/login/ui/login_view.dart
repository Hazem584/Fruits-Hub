import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/di/get_it_service.dart';
import 'package:fruits_e_commerce/core/widgets/app_bar.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_e_commerce/features/login/logic/login_cubit.dart';
import 'package:fruits_e_commerce/features/login/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(title: 'تسجيل دخول', context: context),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}

