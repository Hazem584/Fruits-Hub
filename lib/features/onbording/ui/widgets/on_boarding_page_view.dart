import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/spacing.dart';
import 'package:fruits_e_commerce/core/theming/styles.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/features/onbording/ui/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true,
          image: Assets.assetsImagesPageViewItem1Image,
          backgroundImage: Assets.assetsImagesPageViewItem1Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("مرحبًا بك في", style: TextStyles.font23BlackBold),
              horizontalSpace(5),
              Text(
                "HUB",
                style: TextStyles.font23BlackBold.copyWith(
                  color: Colors.orange.shade400,
                ),
              ),
              Text(
                "Fruit",
                style: TextStyles.font23BlackBold.copyWith(color: Colors.green),
              ),
            ],
          ),
          subTitle: Text(
            "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
            textAlign: TextAlign.center,
            style: TextStyles.font13lightGraySemiBold,
          ),
        ),
        PageViewItem(
          isVisible: false,
          image: Assets.assetsImagesPageViewItem2Image,
          backgroundImage: Assets.assetsImagesPageViewItem2Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ابحث وتسوق",
                textAlign: TextAlign.center,
                style: TextStyles.font23BlackBold,
              ),
            ],
          ),
          subTitle: Text(
            "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
            textAlign: TextAlign.center,
            style: TextStyles.font13lightGraySemiBold,
          ),
        ),
      ],
    );
  }
}
