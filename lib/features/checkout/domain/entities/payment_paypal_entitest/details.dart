import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };
  factory Details.fromEntity(OrderInputEntity entity) => Details(
    subtotal: entity.cartEntity.calculateTotalPrice().toString(),
    shipping: entity.calculateShippingCost().toString(),
    shippingDiscount: entity.calculateShippingDiscount(),
  );
}
