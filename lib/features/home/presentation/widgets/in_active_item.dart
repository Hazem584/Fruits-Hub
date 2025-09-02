import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(8.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: SvgPicture.asset(image, key: ValueKey(image)),
      ),
    );
  }
}
