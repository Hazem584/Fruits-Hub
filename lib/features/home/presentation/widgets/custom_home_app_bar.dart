import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/core/widgets/notifications_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: NotificationsWidget(),
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
