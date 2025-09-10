import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruits_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_header.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BuildAppBar(
                    context,
                    title: 'السلة',
                    showBackButton: true,
                    showNotification: false,
                  ),
                  verticalSpace(20),
                  CartHeader(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cart.cartItems.isEmpty
                  ? SizedBox()
                  : Divider(color: Color(0xfff1f1f5), thickness: 1, height: 22),
            ),
            CartItemsList(cartItems: []),
          ],
        ),
        Positioned(
          right: 16,
          left: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: AppTextButton(
            buttonText: "الدفع  120جنيه",
            textStyle: TextStyles.font15WhiteBold,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
