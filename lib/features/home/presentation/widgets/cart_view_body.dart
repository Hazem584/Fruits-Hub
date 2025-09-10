import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_header.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              BuildAppBar(
                context,
                title: 'السلة',
                showBackButton: true,
                showNotification: false,
              ),
              verticalSpace(20),
              CartHeader(),
              verticalSpace(20),
              const CartItem(),
            ],
          ),
        ),
      ],
    );
  }
}
