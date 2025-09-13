import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/best_selling_fruits/presentation/view/best_selling_view.dart';
import 'package:fruits_e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/cart_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/main_view.dart';
import 'package:fruits_e_commerce/features/home/presentation/view/products_view.dart';
import 'package:fruits_e_commerce/features/login/ui/login_view.dart';
import 'package:fruits_e_commerce/features/onbording/ui/screen/on_bording_view.dart';
import 'package:fruits_e_commerce/features/signup/signup_view.dart'
    show SignupView;

import '../../features/splash/ui/screen/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const ProductsView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (_) => const CartView());
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (_) => const CheckoutView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}
