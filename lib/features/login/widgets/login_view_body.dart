import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/core/widgets/or_divider.dart';
import 'package:fruits_e_commerce/features/login/widgets/dont_have_an_account.dart';
import 'package:fruits_e_commerce/features/login/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool isPasswordVisible = false;

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
            isObscureText: !isPasswordVisible,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              child: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppColors.lightGray,
              ),
            ),
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

          verticalSpace(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.font13lightGreenSemiBold,
              ),
            ),
          ),
          verticalSpace(33),
          AppTextButton(
            borderRadius: 19,
            buttonText: 'تسجيل دخول',
            textStyle: TextStyles.font15WhiteBold,
            buttonWidth: 300.w,
            buttonHeight: 63.h,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              // Handle login action
            },
          ),
          verticalSpace(30),
          const DontHaveAnAccount(),
          verticalSpace(30),
          const OrDivider(),
          verticalSpace(16),
          SocialLoginButton(
            image: Assets.googleIcon,
            label: Text(
              "تسجيل بواسطة جوجل",
              style: TextStyles.font16BlackSemiBold,
              textAlign: TextAlign.center,
            ),
            onPressed: () {},
          ),
          verticalSpace(15),
          SocialLoginButton(
            image: Assets.appleIcon,
            label: Text(
              "تسجيل بواسطة أبل",
              style: TextStyles.font16BlackSemiBold,
              textAlign: TextAlign.center,
            ),
            onPressed: () {},
          ),
          verticalSpace(15),
          SocialLoginButton(
            image: Assets.facebookIcon,
            label: Text(
              "تسجيل بواسطة فيسبوك",
              style: TextStyles.font16BlackSemiBold,
              textAlign: TextAlign.center,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
