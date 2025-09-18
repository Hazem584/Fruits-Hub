import 'package:bloc/bloc.dart';
import 'package:fruits_e_commerce/core/entities/product_entity.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cart = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cart.isExist(productEntity);
    var cartItemEntity = cart.getCartItemByProduct(productEntity);
    if (isProductExist) {
      cartItemEntity.incrementQuantity();
    } else {
      cart.addCartItem(cartItemEntity);
    }
    emit(CartItemAdded());
  }

  void delateCartItem(CartItemEntity productEntity) {
    cart.removeCartItem(productEntity);
    emit(CartItemRemoved());
  }
}
