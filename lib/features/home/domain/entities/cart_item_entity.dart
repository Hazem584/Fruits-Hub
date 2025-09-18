import 'package:equatable/equatable.dart';
import 'package:fruits_e_commerce/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  incrementQuantity() {
    quantity++;
  }

  decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity, quantity];
}
