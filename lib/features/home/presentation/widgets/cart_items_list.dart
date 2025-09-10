import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    print('CartItemsList: cartItems length = ${cartItems.length}');
    return SliverList.separated(
      separatorBuilder: (context, index) =>
          const Divider(color: Color(0xfff1f1f5), thickness: 1, height: 22),
      itemCount: cartItems.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CartItem(cartItemEntity: cartItems[index]),
      ),
    );
  }
}
