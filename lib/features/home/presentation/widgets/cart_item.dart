import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_otem_action_buttons.dart';

import '../../../../../core/utils/app_images.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
            child: Image.network(
              cartItemEntity.productEntity.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      cartItemEntity.productEntity.name,
                      style: TextStyles.font13BlackSemiBold,
                    ),

                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().delateCartItem(
                          cartItemEntity,
                        );
                      },
                      icon: SvgPicture.asset(Assets.assetsImagesTrash),
                    ),
                  ],
                ),
                Text(
                  "${cartItemEntity.calculateTotalWeight()} كم",
                  style: TextStyles.font13OrangeBold,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice()} جنيه ',
                      style: TextStyles.font13OrangeBold,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
