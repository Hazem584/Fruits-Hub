import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/cubits/producs_cubit/product_cubit.dart';
import 'package:fruits_e_commerce/core/helper/get_dummy_product.dart';
import 'package:fruits_e_commerce/core/widgets/custom_error_widget.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/product_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductCubitState>(
      builder: (context, state) {
        if (state is ProductCubitSuccess) {
          return ProductGridView(products: state.products);
        } else if (state is ProductCubitError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(message: state.message),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
