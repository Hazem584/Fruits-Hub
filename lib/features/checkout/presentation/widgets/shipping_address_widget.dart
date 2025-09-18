import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:provider/provider.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderEntity>(
      builder: (context, orderEntity, child) {
        String addressText = "شارع النيل، مبنى رقم ١٢٣";
        if (orderEntity.shippingAddress.address?.isNotEmpty == true) {
          addressText =
              "${orderEntity.shippingAddress.address}, ${orderEntity.shippingAddress.city ?? ''}";
          if (orderEntity.shippingAddress.addressDetails?.isNotEmpty == true) {
            addressText += " - ${orderEntity.shippingAddress.addressDetails}";
          }
        }

        return PaymentItem(
          title: 'عنوان التوصيل',
          child: Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesLocation),
              horizontalSpace(7),
              Expanded(
                child: Text(
                  addressText,
                  textAlign: TextAlign.right,
                  style: TextStyles.font13lightGraySemiBold,
                ),
              ),
              horizontalSpace(7),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(Assets.assetsImagesEdit),
                    const SizedBox(width: 4),
                    Text('تعديل', style: TextStyles.font13lightGraySemiBold),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
