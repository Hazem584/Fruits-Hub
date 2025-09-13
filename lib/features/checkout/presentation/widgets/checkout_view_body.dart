import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          verticalSpace(20),
          const CheckoutSteps(),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          AppTextButton(
            buttonText: "التالي",
            textStyle: TextStyles.font15WhiteBold,
            onPressed: () {
              if (pageController.page == (getSteps().length - 1)) {
                // Submit the order
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
          verticalSpace(28),
        ],
      ),
    );
  }
}
