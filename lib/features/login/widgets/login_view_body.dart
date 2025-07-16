import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(24),
          AppTextFormFiled(
            hintText: 'البريد الإلكتروني',
            backgroundColor: Color(0xFFF9FAFA),
            hintStyle: TextStyles.font13lighterGrayBold,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
          ),
          verticalSpace(20),
          AppTextFormFiled(
            isObscureText: true,
            backgroundColor: Color(0xFFF9FAFA),
            hintText: 'كلمة المرور',
            hintStyle: TextStyles.font13lighterGrayBold,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            suffixIcon: Icon(
              Icons.remove_red_eye,
              color: AppColors.lighterGray,
            ),
          ),
        ],
      ),
    );
  }
}
