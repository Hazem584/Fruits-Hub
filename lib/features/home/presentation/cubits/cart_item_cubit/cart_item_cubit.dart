import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  void updateCartItems(CartItemEntity cartItems) {
    emit(CartItemUpdate(cartItems));
  }
}