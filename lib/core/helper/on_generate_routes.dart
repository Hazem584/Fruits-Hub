

import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/features/login/ui/login_view.dart';
import 'package:fruits_e_commerce/features/onbording/ui/screen/on_bording_view.dart';
import 'package:fruits_e_commerce/features/signup/signup_view.dart' show SignupView;
import 'package:fruits_e_commerce/generated/l10n.dart';

import '../../features/splash/ui/screen/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
      case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      return MaterialPageRoute(builder: (_) => const SplashView());
  }
}