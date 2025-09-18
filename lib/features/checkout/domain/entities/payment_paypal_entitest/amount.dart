import 'package:fruits_e_commerce/core/helper/get_currency.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity entity) => Amount(
    total: entity.calculateTotalPriceAfterDiscountAndShipping().toString(),
    currency: getCurrency(),
    details: Details.fromEntity(entity),
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };
}
