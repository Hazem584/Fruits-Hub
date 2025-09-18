import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/address_input_section.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/payment_section.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenable;

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
      AddressInputSection(formKey: formKey, valueListenable: valueListenable),
      PaymentSection(pageController: pageController),
    ];
  }
}
