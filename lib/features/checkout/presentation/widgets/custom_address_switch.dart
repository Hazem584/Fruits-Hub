import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';

class CustomAddressSwitch extends StatefulWidget {
  const CustomAddressSwitch({
    super.key,
    this.initialValue = false,
    this.onChanged,
    this.activeColor = const Color(0xFF4CAF50),
    this.inactiveColor = const Color(0xFFE0E0E0),
  });

  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;

  @override
  State<CustomAddressSwitch> createState() => _CustomAddressSwitchState();
}

class _CustomAddressSwitchState extends State<CustomAddressSwitch>
    with SingleTickerProviderStateMixin {
  late bool _isActive;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _isActive = widget.initialValue;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: widget.inactiveColor,
      end: AppColors.primaryColor,
    ).animate(_animationController);

    if (_isActive) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isActive = !_isActive;
      if (_isActive) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });

    widget.onChanged?.call(_isActive);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: _handleTap,
            child: Container(
              width: 50,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.transparent, width: 0),
              ),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: _colorAnimation.value,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          left: _isActive ? 22 : 2,
                          top: 2,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          horizontalSpace(10),
          Text('حفظ العنوان', style: TextStyles.font13lighterGraySemiBold),
        ],
      ),
    );
  }
}
