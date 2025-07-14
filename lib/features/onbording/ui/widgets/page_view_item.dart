import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.isVisble,
  });
  final String image, backgroundImage;
  final Widget title;
  final String subTitle;
  final bool isVisble;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: SvgPicture.asset(image),
                ),
                Visibility(
                  visible: isVisble,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("تخط"),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(30),
          title,
          verticalSpace(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(subTitle, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
