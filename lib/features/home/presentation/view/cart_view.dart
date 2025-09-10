import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'cart';

  @override
  Widget build(BuildContext context) {
    return CartViewBody();
  }
}