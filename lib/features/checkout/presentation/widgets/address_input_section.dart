import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/custom_address_switch.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        AppTextFormFiled(
          hintText: "الاسم الكامل",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.name,
        ),
        verticalSpace(10),
        AppTextFormFiled(
          hintText: "رقم الهاتف",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.phone,
        ),
        verticalSpace(10),
        AppTextFormFiled(
          hintText: "البريد الإلكتروني",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.emailAddress,
        ),
        verticalSpace(10),
        AppTextFormFiled(
          hintText: "العنوان",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.streetAddress,
        ),
        verticalSpace(10),
        AppTextFormFiled(
          hintText: "المدينه",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.text,
        ),
        verticalSpace(10),
        AppTextFormFiled(
          hintText: "رقم الطابق , رقم الشقه ..",
          inputTextStyle: TextStyles.font16BlackBold,
          backgroundColor: const Color(0xffF9FAFA),
          keyboardType: TextInputType.text,
        ),
        verticalSpace(10),
        CustomAddressSwitch(
          initialValue: true,
          onChanged: (value) {
            print('Switch value changed: $value');
          },
        ),
      ],
    );
  }
}
