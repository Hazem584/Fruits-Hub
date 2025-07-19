import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/signup/signup_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'لا تمتلك حساب؟ ',
        style: TextStyles.font13lightGraySemiBold,
        children: [
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: TextStyles.font13PrimaryColorSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
          ),
        ],
      ),
    );
  }
}
