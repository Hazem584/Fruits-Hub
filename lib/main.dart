import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce/core/helper/on_generate_routes.dart';
import 'package:fruits_e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';
import 'package:fruits_e_commerce/features/splash/ui/screen/splash_view.dart';
import 'package:fruits_e_commerce/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await ScreenUtil.ensureScreenSize();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Cairo',
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
            ),
          ),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: SplashView.routeName,
          onGenerateRoute: onGenerateRoutes,
        );
      },
    );
  }
}
