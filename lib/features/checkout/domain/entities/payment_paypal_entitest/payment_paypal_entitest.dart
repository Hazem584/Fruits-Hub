import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaymentPaypalEntities {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaymentPaypalEntities({this.amount, this.description, this.itemList});

  PaymentPaypalEntities.fromEntity(OrderEntity entity) {
    amount = Amount.fromEntity(entity);
    description = "The payment transaction description.";
    itemList = ItemList.fromEntity(items: entity.cartEntity.cartItems);
  }

  Map<String, dynamic> toJson() => {
    'amount': amount?.toJson(),
    'description': description,
    'item_list': itemList?.toJson(),
  };
}
