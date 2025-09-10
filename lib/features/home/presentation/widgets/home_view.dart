import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/cubits/producs_cubit/product_cubit.dart';
import 'package:fruits_e_commerce/core/di/get_it_service.dart';
import 'package:fruits_e_commerce/core/repos/products_repos/product_repo.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>()),
      child: HomeVIewBody(),
    );
  }
}
