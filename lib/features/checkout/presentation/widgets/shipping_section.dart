import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40 جنيه',
        ),
        verticalSpace(16),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
