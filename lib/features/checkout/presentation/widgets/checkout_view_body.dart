import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_keys.dart';
import 'package:fruits_e_commerce/core/widgets/app_text_button.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce/features/checkout/domain/entities/payment_paypal_entitest/payment_paypal_entitest.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_steps.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          verticalSpace(20),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),
          AppTextButton(
            buttonText: getNextButtonText(currentPageIndex),
            textStyle: TextStyles.font15WhiteBold,
            onPressed: () {
              if (currentPageIndex == 0) {
                _handelShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handelAddressSectionValidation(context);
              } else {
                _handelPaymentSectionValidation(context);
              }
            },
          ),
          verticalSpace(28),
        ],
      ),
    );
  }

  void _handelShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("يرجى اختيار طريقة الدفع اولا!"),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return "التالي";
      case 1:
        return "التالي";
      case 2:
        return "الدفع عبر PayPal";
      default:
        return "التالي";
    }
  }

  void _handelAddressSectionValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handelPaymentSectionValidation(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaymentPaypalEntities paymentPaypalEntities =
        PaymentPaypalEntities.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    print(paymentPaypalEntities.toJson().toString());

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretKey,
          transactions: [paymentPaypalEntities.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            await addOrderCubit.addOrder(order: orderEntity);
            Navigator.pop(context);
          },
          onError: (error) {
            Navigator.pop(context);
            print("onError: $error");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("حدث خطأ في عمليه الدفع!"),
                duration: Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}
