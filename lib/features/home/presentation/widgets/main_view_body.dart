import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/cart_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/products_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: [const HomeView(), const ProductsView(), const CartView()],
    );
  }
}
