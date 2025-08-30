import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonText: "تسوق الان",
      textStyle: TextStyles.font13PrimaryColorBold,
      onPressed: () {},
      backgroundColor: Colors.white,
      borderRadius: 5,
      buttonHeight: 35.h,
      buttonWidth: 120.w,
    );
  }
}
