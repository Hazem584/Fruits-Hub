import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/helper/on_generate_routes.dart';
import 'package:fruits_e_commerce/features/splash/ui/screen/splash_view.dart';

void main() {
  runApp( const FruitHub());
}
 
class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:onGenerateRoutes,
        initialRoute: SplashView.routeName,
    );
  }
}