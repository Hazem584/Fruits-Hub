import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruits_e_commerce/features/home/presentation/widgets/navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 72.h,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            blurRadius: 25,
            color: Color(0x19000000),
            spreadRadius: 0,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: NavigationBarItem(
              isSelected: currentIndex == index,
              bottomNavigationBarEntity: entity,
            ),
          );
        }).toList(),
      ),
    );
  }
}
