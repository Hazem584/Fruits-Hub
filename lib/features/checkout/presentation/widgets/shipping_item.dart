import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.isSelected,
    required this.onTap,
  });
  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 13,
          right: 28,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
            ),
          ),
          color: const Color(0x33d9d9d9),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingDot()
                  : const InActiveShippingDot(),
              horizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.font13BlackSemiBold),
                  verticalSpace(4),
                  Text(subtitle, style: TextStyles.font13lighterGraySemiBold),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(price, style: TextStyles.font13lightGreenSemiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingDot extends StatelessWidget {
  const InActiveShippingDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1.5, color: Color(0xff949d9e)),
        ),
      ),
    );
  }
}

class ActiveShippingDot extends StatelessWidget {
  const ActiveShippingDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
