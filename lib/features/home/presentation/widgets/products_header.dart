import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/features/best_selling_fruits/presentation/view/best_selling_view.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productLength});
  final int productLength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, BestSellingView.routeName);
        },
        child: Row(
          children: [
            Text("$productLength نتائج", style: TextStyles.font16BlackBold),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0x66cacece)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: SvgPicture.asset(Assets.assetsImagesSwaper),
            ),
          ],
        ),
      ),
    );
  }
}
