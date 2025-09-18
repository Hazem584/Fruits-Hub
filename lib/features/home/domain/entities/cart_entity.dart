import 'package:fruits_e_commerce/core/entities/product_entity.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity productEntity) {
    bool isExist = false;
    for (var item in cartItems) {
      if (item.productEntity == productEntity) {
        return true;
      }
    }
    return isExist;
  }

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.calculateTotalPrice();
    }
    return total;
  }

  CartItemEntity getCartItemByProduct(ProductEntity productEntity) {
    for (var item in cartItems) {
      if (item.productEntity == productEntity) {
        return item;
      }
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  removeCartItem(CartItemEntity cartEntity) {
    cartItems.remove(cartEntity);
  }
}
