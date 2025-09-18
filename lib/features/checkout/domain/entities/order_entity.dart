import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_entity.dart';

class OrderEntity extends ChangeNotifier {
  final CartEntity cartEntity;
  bool? _payWithCash;
  ShippingAddressEntity shippingAddress;
  final String uID;

  OrderEntity(
    this.cartEntity, {
    bool? payWithCash,
    required this.shippingAddress,
    required String place,
    required this.uID,
  }) : _payWithCash = payWithCash {
    log("OrderEntity $place");
  }

  // Getter for payWithCash
  bool? get payWithCash => _payWithCash;

  // Setter for payWithCash with notification
  set payWithCash(bool? value) {
    if (_payWithCash != value) {
      _payWithCash = value;
      notifyListeners();
    }
  }

  // Helper method to get selected payment index
  int get selectedPaymentIndex {
    if (_payWithCash == true) return 0; // Cash payment
    if (_payWithCash == false) return 1; // Online payment
    return -1; // No selection
  }

  // Method to clear payment selection
  void clearPaymentSelection() {
    payWithCash = null;
  }

  double calculateShippingCost() {
    if (payWithCash == true) {
      return 0;
    } else {
      return 40;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    double total = 0.0;
    for (var item in cartEntity.cartItems) {
      total += item.calculateTotalPrice();
    }
    return total + calculateShippingCost() - calculateShippingDiscount();
  }

}
