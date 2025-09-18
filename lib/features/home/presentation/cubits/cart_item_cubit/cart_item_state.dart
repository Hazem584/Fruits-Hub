part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdate extends CartItemState {
  final CartItemEntity cartItems;
  const CartItemUpdate(this.cartItems);
}
