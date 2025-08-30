import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/core/widgets/or_divider.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/home_view.dart';
import 'package:fruits_e_commerce/features/login/logic/login_cubit.dart';
import 'package:fruits_e_commerce/features/login/widgets/dont_have_an_account.dart';
import 'package:fruits_e_commerce/features/login/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            verticalSpace(24),
            AppTextFormFiled(
              onSaved: (value) {
                email = value!;
              },
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
              onSaved: (value) {
                password = value!;
              },
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
                Navigator.pushNamed(context, HomeView.routeName);
                // if (formKey.currentState!.validate()) {
                //   formKey.currentState!.save();
                //   context.read<LoginCubit>().login(email, password);
                // } else {
                //   autovalidateMode = AutovalidateMode.always;
                //   setState(() {});
                // }
              },
            ),
            verticalSpace(30),
            const DontHaveAnAccount(),
            verticalSpace(30),
            const OrDivider(),
            verticalSpace(16),
            SocialLoginButton(
              image: Assets.assetsImagesGoogleIcon,
              label: Text(
                "تسجيل بواسطة جوجل",
                style: TextStyles.font16BlackSemiBold,
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                context.read<LoginCubit>().loginWithGoogle();
              },
            ),
            verticalSpace(13),
            Platform.isIOS
                ? Column(
                    children: [
                      SocialLoginButton(
                        image: Assets.assetsImagesAppleIcon,
                        label: Text(
                          "تسجيل بواسطة أبل",
                          style: TextStyles.font16BlackSemiBold,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                : const SizedBox(),
            verticalSpace(15),
            SocialLoginButton(
              image: Assets.assetsImagesFacebookIcon,
              label: Text(
                "تسجيل بواسطة فيسبوك",
                style: TextStyles.font16BlackSemiBold,
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                context.read<LoginCubit>().loginWithFacebook();
              },
            ),
          ],
        ),
      ),
    );
  }
}
