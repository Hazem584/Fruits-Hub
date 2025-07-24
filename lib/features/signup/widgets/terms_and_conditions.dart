import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/signup/widgets/custom_check_box.dart';

class TermsAndConditionsWithCallback extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool> onChanged;

  const TermsAndConditionsWithCallback({
    super.key,
    required this.isAccepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(value: isAccepted, onChanged: onChanged),
        SizedBox(width: 8),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.font13lighterGrayBold,
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.font13lighterGrayBold.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

