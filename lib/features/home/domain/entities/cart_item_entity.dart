import 'package:equatable/equatable.dart';
import 'package:fruits_e_commerce/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  incrementCount() {
    count++;
  }

  decrementCount() {
    if (count > 0) {
      count--;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity, count];
}
