import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/payment_item.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: "ملخص الطلب :",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "المجموع الفرعي :",
                style: TextStyles.font13lightGraySemiBold,
              ),
              const Spacer(),
              Text("150 جنيه", style: TextStyles.font16BlackSemiBold),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              Text("التوصيل :", style: TextStyles.font13lightGraySemiBold),
              const Spacer(),
              Text("30 جنيه", style: TextStyles.font13lightGraySemiBold),
            ],
          ),
          verticalSpace(9),
          const Divider(thickness: 0.5, color: Color(0xffcacece)),
          verticalSpace(9),
          Row(
            children: [
              Text("المجموع الكلي :", style: TextStyles.font16BlackBold),
              const Spacer(),
              Text("180 جنيه", style: TextStyles.font16BlackSemiBold),
            ],
          ),
        ],
      ),
    );
  }
}
