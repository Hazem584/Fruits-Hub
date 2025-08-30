import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xffEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
          width: 24,
          height: 24,
        ),
      ),
      leading: Image.asset(Assets.assetsImagesAvatarImage),
      title: Text(
        "صباح الخير !..",
        textAlign: TextAlign.right,
        style: TextStyles.font16lighterGraySemiBold,
      ),
      subtitle: Text(
        "حازم محمد",
        textAlign: TextAlign.right,
        style: TextStyles.font16BlackBold,
      ),
    );
  }
}
