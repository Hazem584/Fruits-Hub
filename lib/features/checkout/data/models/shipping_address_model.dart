import 'package:fruits_e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? email;
  String? address;
  String? city;
  String? addressDetails;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      addressDetails: entity.addressDetails,
    );
  }
  toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'address': address,
    'city': city,
    'addressDetails': addressDetails,
  };
}
