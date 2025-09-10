import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/cart_otem_action_buttons.dart';

import '../../../../../core/utils/app_images.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

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
              'https://i.postimg.cc/3x3QzSGq/Watermelon.png',
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('بطيخ', style: TextStyles.font13BlackSemiBold),

                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.assetsImagesTrash),
                      ),
                    ],
                  ),
                  Text("3 كم", style: TextStyles.font13OrangeBold),
                  verticalSpace(8),
                  Row(
                    children: [
                      const CartItemActionButtons(),
                      const Spacer(),
                      Text('60 جنيه ', style: TextStyles.font13OrangeBold),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
