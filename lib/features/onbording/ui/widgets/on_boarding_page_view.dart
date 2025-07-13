import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/utils/app_images.dart';
import 'package:fruits_e_commerce/features/onbording/ui/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("مرحبا بكم في"), Text("Fruit"), Text("HUB")],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
        ),
        PageViewItem(
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2Background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ابحث وتسوق",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                  height: 0,
                ),
              ),
            ],
          ),
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
        ),
      ],
    );
  }
}
