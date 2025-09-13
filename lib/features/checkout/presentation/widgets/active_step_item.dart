import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 13,
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.check, color: Colors.white, size: 22),
        ),
        horizontalSpace(4),
        Text(text, style: TextStyles.font13PrimaryColorBold),
      ],
    );
  }
}
