import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/features/signup/logic/signup_cubit.dart';
import 'package:fruits_e_commerce/features/signup/widgets/already_have_an_account.dart';
import 'package:fruits_e_commerce/features/signup/widgets/custom_check_box.dart';
import 'package:fruits_e_commerce/features/signup/utils/signup_validators.dart';
import 'package:fruits_e_commerce/features/signup/widgets/terms_and_conditions.dart'; // Import the utilities

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, password, email;
  bool isTermsAccepted = false; // Add checkbox state
  bool isPasswordVisible = false; // Add password visibility state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpace(24),
            AppTextFormFiled(
              onSaved: (value) {
                name = value!;
              },
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
            verticalSpace(15),
            AppTextFormFiled(
              onSaved: (value) {
                password = value!;
              },
              isObscureText: !isPasswordVisible, // Toggle based on state
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
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
            verticalSpace(15),

            // Updated TermsAndConditions to accept callback
            TermsAndConditionsWithCallback(
              isAccepted: isTermsAccepted,
              onChanged: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              },
            ),

            verticalSpace(20),
            AppTextButton(
              borderRadius: 19,
              buttonText: "إنشاء حساب جديد",
              textStyle: TextStyles.font15WhiteBold,
              buttonWidth: 300.w,
              buttonHeight: 63.h,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                SignupValidators.validateAndSignup(
                  context: context,
                  formKey: formKey,
                  isTermsAccepted: isTermsAccepted,
                  onFormValid: () {
                    formKey.currentState!.save();
                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                      name: name,
                    );
                  },
                  onFormInvalid: () {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  },
                );
              },
            ),
            verticalSpace(20),
            AlreadyHaveAnAccount(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
