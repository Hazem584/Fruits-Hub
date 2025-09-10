import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/entities/product_entity.dart';
import 'package:fruits_e_commerce/core/widgets/fruit_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FruitItem(productEntity: products[index]);
        },
      ),
    );
  }
}
