import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        horizontalSpace(16),
        Text('أو', style: TextStyles.font13BlackSemiBold),
        horizontalSpace(16),
        Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
