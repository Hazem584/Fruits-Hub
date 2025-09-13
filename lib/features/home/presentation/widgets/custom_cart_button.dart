import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<CartItemCubit, CartItemState>(
          builder: (context, state) {
            return AppTextButton(
              buttonText:
                  "الدفع  ${context.watch<CartCubit>().cart.calculateTotalPrice()} جنيه",
              textStyle: TextStyles.font15WhiteBold,
              onPressed: () {
                Navigator.pushNamed(context, CheckoutView.routeName);
              },
            );
          },
        );
      },
    );
  }
}
