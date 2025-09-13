import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/di/get_it_service.dart';
import 'package:fruits_e_commerce/core/widgets/app_bar.dart';
import 'package:fruits_e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:fruits_e_commerce/features/signup/logic/signup_cubit.dart';
import 'package:fruits_e_commerce/features/signup/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup';
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "حساب جديد"),
        body: const SignupViewBodyBlocConsumer(), 
      ),
    );
  }
}