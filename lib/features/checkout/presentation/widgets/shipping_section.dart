import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderEntity>(
      builder: (context, orderEntity, child) {
        return Column(
          children: [
            verticalSpace(30),
            ShippingItem(
              onTap: () {
                orderEntity.payWithCash = true;
              },
              isSelected: orderEntity.selectedPaymentIndex == 0,
              title: 'الدفع عند الاستلام',
              subtitle: 'التسليم من المكان',
              price: (orderEntity.cartEntity.calculateTotalPrice() + 40)
                  .toString(),
            ),
            verticalSpace(16),
            ShippingItem(
              onTap: () {
                orderEntity.payWithCash = false;
              },
              isSelected: orderEntity.selectedPaymentIndex == 1,
              title: 'الدفع اونلاين',
              subtitle: 'يرجي تحديد طريقه الدفع',
              price: orderEntity.cartEntity.calculateTotalPrice().toString(),
            ),
          ],
        );
      },
    );
  }
}
