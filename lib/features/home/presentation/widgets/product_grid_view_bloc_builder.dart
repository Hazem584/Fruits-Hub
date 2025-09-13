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
        print("🎯 ProductGridView State: ${state.runtimeType}");

        if (state is ProductCubitSuccess) {
          print("✅ Success: ${state.products.length} products");
          if (state.products.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('لا توجد منتجات')),
            );
          }
          return ProductGridView(products: state.products);
        } else if (state is ProductCubitError) {
          print("❌ Error: ${state.message}");
          return SliverToBoxAdapter(
            child: Column(
              children: [
                CustomErrorWidget(message: state.message),
                ElevatedButton(
                  onPressed: () =>
                      context.read<ProductCubit>().fetchAllProducts(),
                  child: const Text('إعادة المحاولة'),
                ),
              ],
            ),
          );
        } else {
          print("⏳ Loading state - showing skeleton");
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductGridView(products: getDummyProducts()),
          );
        }
      },
    );
  }
}
