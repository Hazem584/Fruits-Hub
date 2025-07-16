import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

AppBar buildAppBar({context, required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(title, style: TextStyles.font19BlackBold),
    centerTitle: true,
  );
}
