import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/best_selling_fruits/presentation/view/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BestSellingView.routeName);
        },
        child: Row(
          children: [
            Text("الاكثر مبيعا", style: TextStyles.font16BlackBold),
            const Spacer(),
            Text("المزيد", style: TextStyles.font13lightGraySemiBold),
          ],
        ),
      ),
    );
  }
}
