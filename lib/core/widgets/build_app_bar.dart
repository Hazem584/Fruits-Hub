import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/notifications_widget.dart';

AppBar BuildAppBar(
  context, {
  required String title,
  bool showBackButton = true,
  bool showNotification = true,
}) {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Visibility(
          visible: showNotification,
          child: const NotificationsWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(title, style: TextStyles.font19SemiBlackBold),
  );
}
