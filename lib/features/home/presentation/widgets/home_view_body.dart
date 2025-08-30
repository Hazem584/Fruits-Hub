import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/widgets/search_text_field.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
        BestSellingGridView(),
      ],
    );
  }
}
