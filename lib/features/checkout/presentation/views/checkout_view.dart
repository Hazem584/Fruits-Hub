import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(context, title: "الشحن", showNotification: false),
      body: const CheckoutViewBody(),
    );
  }
}
