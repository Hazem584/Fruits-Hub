import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/payment_item.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          SvgPicture.asset(Assets.assetsImagesLocation),
          const SizedBox(width: 8),
          Text(
            "شارع النيل، مبنى رقم ١٢٣",
            textAlign: TextAlign.right,
            style: TextStyles.font13lightGraySemiBold,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.assetsImagesEdit),
                  const SizedBox(width: 4),
                  Text('تعديل', style: TextStyles.font13lightGraySemiBold),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
