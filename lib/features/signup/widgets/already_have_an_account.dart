import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/login/ui/login_view.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'تمتلك حساب بالفعل؟ ',
        style: TextStyles.font13lightGraySemiBold,
        children: [
          TextSpan(
            text: 'تسجيل دخول',
            style: TextStyles.font13PrimaryColorSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, LoginView.routeName);
              },
          ),
        ],
      ),
    );
  }
}