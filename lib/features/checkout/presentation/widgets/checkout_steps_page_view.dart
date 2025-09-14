import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/address_input_section.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/payment_section.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final pages = getPages();
          return index < pages.length ? pages[index] : const SizedBox.shrink();
        },
        itemCount: getPages().length,
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      const AddressInputSection(),
      PaymentSection(pageController: pageController),
    ];
  }
}
