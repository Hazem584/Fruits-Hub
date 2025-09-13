import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_steps.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [CheckoutSteps()]),
    );
  }
}
