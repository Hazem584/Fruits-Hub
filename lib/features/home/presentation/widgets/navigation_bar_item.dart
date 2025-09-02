import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/active_item.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: isSelected
          ? ActiveItem(
              key: ValueKey('active_${bottomNavigationBarEntity.name}'),
              image: bottomNavigationBarEntity.activeImage,
              text: bottomNavigationBarEntity.name,
            )
          : InActiveItem(
              key: ValueKey('inactive_${bottomNavigationBarEntity.name}'),
              image: bottomNavigationBarEntity.inActiveImage,
            ),
    );
  }
}