import 'package:fruits_e_commerce/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_e_commerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProductModels;
  final String paymentMethod;
  final String orderId;
  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.shippingAddress,
    required this.orderProductModels,
    required this.paymentMethod,
  });
  factory OrderModel.fromEntity(OrderInputEntity order) => OrderModel(
    orderId: const Uuid().v4(),
    totalPrice: order.cartEntity.calculateTotalPrice(),
    uId: order.uID,
    shippingAddress: ShippingAddressModel.fromEntity(order.shippingAddress),
    orderProductModels: order.cartEntity.cartItems
        .map((e) => OrderProductModel.fromEntity(product: e))
        .toList(),
    paymentMethod: order.payWithCash! ? 'cash' : 'PayPal',
  );
  toJson() => {
    'orderId': orderId,
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddress.toJson(),
    'orderProductModels': orderProductModels.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}
