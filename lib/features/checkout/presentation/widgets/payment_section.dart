import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/order_summary_widget.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        const OrderSummaryWidget(),
        verticalSpace(24),
        ShippingAddressWidget(pageController: pageController),
      ],
    );
  }
}
