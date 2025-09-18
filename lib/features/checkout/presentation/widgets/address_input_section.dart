import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_form_filed.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/custom_address_switch.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              verticalSpace(24),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.name = value!;
                },
                hintText: "الاسم الكامل",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.phone = value!;
                },
                hintText: "رقم الهاتف",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.email = value!;
                },
                hintText: "البريد الإلكتروني",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.address = value!;
                },
                hintText: "العنوان",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.city = value!;
                },
                hintText: "المدينه",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              AppTextFormFiled(
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress.addressDetails =
                      value!;
                },
                hintText: "رقم الطابق , رقم الشقه ..",
                inputTextStyle: TextStyles.font16BlackBold,
                backgroundColor: const Color(0xffF9FAFA),
              ),
              verticalSpace(10),
              CustomAddressSwitch(
                initialValue: true,
                onChanged: (value) {
                  print('Switch value changed: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
