import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/cubits/producs_cubit/product_cubit.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce/core/widgets/search_text_field.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/product_grid_view_bloc_builder.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/products_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    print("🛒 ProductsView initState - calling fetchAllProducts");
    context.read<ProductCubit>().fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              BuildAppBar(context, title: 'المنتجات', showBackButton: false),
              verticalSpace(20),
              const SearchTextField(),
              verticalSpace(12),
              ProductsHeader(
                productLength: context.watch<ProductCubit>().productLength,
              ),
              verticalSpace(12),
            ],
          ),
        ),
        const ProductGridViewBlocBuilder(),
      ],
    );
  }
}
