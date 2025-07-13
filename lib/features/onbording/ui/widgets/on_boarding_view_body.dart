import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/features/onbording/ui/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView()),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: AppColors.secondaryColor,
          ),
        ),
        verticalSpace(29),
        AppTextButton(
          buttonWidth: 300.w,
          buttonHeight: 65.h,
          buttonText: "ابدأ الان",
          textStyle: TextStyle(color: Colors.white),
          onPressed: () {},
          borderRadius: 16,
          backgroundColor: AppColors.primaryColor,
          verticalPadding: 15,
          horizontalPadding: 48,
        ),
        verticalSpace(43),
      ],
    );
  }
}
