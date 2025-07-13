

import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/onbording/ui/screen/on_bording_view.dart';

import '../../features/splash/ui/screen/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}