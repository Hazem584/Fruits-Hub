import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/active_step_item.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepItem(index: index.toString(), text: text),
      secondChild: ActiveStepItem(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(microseconds: 300),
    );
  }
}
