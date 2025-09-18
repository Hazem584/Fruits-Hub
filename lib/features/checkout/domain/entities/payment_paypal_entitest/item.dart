import 'package:fruits_e_commerce/core/helper/get_currency.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});


  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory ItemEntity.fromEntity(CartItemEntity item) => ItemEntity(
    name: item.productEntity.name,
    quantity: item.quantity,
    price: item.productEntity.price.toString(),
    currency: getCurrency(),
  );
}
