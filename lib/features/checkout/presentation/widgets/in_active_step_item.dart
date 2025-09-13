import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.index, required this.text});
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 13,
          backgroundColor: Color(0xfff2f3f3),
          child: Text(index, style: TextStyles.font13BlackSemiBold),
        ),
        horizontalSpace(4),
        Text(text, style: TextStyles.font13lightGraySemiBold),
      ],
    );
  }
}
