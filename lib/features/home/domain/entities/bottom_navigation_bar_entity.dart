import 'package:fruits_e_commerce/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  String activeImage, inActiveImage;
  final String name;
  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> bottomNavigationBarItems = [
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesHomeActive,
    inActiveImage: Assets.assetsImagesHome,
    name: "الرئيسية",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesProductsIconActive,
    inActiveImage: Assets.assetsImagesProductsIcon,
    name: "المنتجات",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesShoppingCartActive,
    inActiveImage: Assets.assetsImagesShoppingCart,
    name: "سلة التسوق",
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesUserActive,
    inActiveImage: Assets.assetsImagesUser,
    name: "حسابي",
  ),
];
