import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final int quantity;
  final double price;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  factory OrderProductModel.fromEntity({required CartItemEntity product}) {
    return OrderProductModel(
      name: product.productEntity.name,
      code: product.productEntity.code,
      imageUrl: product.productEntity.imageUrl!,
      quantity: product.quantity,
      price: product.productEntity.price.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'price': price,
    };
  }
}
