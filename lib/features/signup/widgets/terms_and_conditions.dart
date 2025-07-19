import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/features/signup/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-2, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 13),
            child: CustomCheckBox(
              value: isChecked,
              onChanged: (newValue) {
                setState(() {
                  isChecked = newValue;
                });
              },
            ),
          ),
          horizontalSpace(3),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "من خلال إنشاء حساب ، فإنك توافق على ",
                    style: TextStyles.font13lighterGraySemiBold,
                  ),
                  TextSpan(
                    text: "الشروط والأحكام الخاصة بنا",
                    style: TextStyles.font13lightGreenSemiBold,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Navigate to terms and conditions page
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
