import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/features/signup/widgets/already_have_an_account.dart';
import 'package:fruits_e_commerce/features/signup/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            verticalSpace(24),
            AppTextFormFiled(
              hintText: "الاسم كامل",
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
            verticalSpace(15),
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
            verticalSpace(15),
            AppTextFormFiled(
              isObscureText: true,
              suffixIcon: Icon(Icons.visibility, color: AppColors.lightGray),
              hintText: 'كلمة المرور',
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
            verticalSpace(15),
            TermsAndConditions(),
            verticalSpace(20),
            AppTextButton(
              borderRadius: 19,
              buttonText: "إنشاء حساب جديد",
              textStyle: TextStyles.font15WhiteBold,
              buttonWidth: 300.w,
              buttonHeight: 63.h,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                // Handle login action
              },
            ),
            verticalSpace(20),
            AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}


