import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/cubits/producs_cubit/product_cubit.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/widgets/search_text_field.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/product_grid_view_bloc_builder.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/featured_list.dart';

class HomeVIewBody extends StatefulWidget {
  const HomeVIewBody({super.key});

  @override
  State<HomeVIewBody> createState() => _HomeVIewBodyState();
}

class _HomeVIewBodyState extends State<HomeVIewBody> {
  @override
  void initState() {
    super.initState();
    print("🏠 HomeView initState - calling fetchBestSellingProducts");
    context.read<ProductCubit>().fetchBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              verticalSpace(20),
              SearchTextField(),
              verticalSpace(12),
              FeaturedList(),
              verticalSpace(14),
              BestSellingHeader(),
              verticalSpace(12),
            ],
          ),
        ),
        ProductGridViewBlocBuilder(),
      ],
    );
  }
}
