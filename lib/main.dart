import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/string_constants.dart';
import 'package:skin_care/core/constants/theme_constants.dart';
import 'package:skin_care/core/controllers/auth/auth_controller.dart';
import 'package:skin_care/core/controllers/cards/cards_controller.dart';
import 'package:skin_care/core/controllers/cart/cart_controller.dart';
import 'package:skin_care/core/controllers/categories/categories_controller.dart';
import 'package:skin_care/core/controllers/detail/detail_controller.dart';
import 'package:skin_care/core/controllers/home/home_controller.dart';
import 'package:skin_care/core/controllers/message/message_controller.dart';
import 'package:skin_care/core/controllers/navigation/navigation_controller.dart';
import 'package:skin_care/core/controllers/review/review_controller.dart';
import 'package:skin_care/core/controllers/settings/settings_controller.dart';
import 'package:skin_care/core/controllers/theme/theme_controller.dart';
import 'package:skin_care/core/controllers/track_location/track_location_controller.dart';
import 'package:skin_care/core/translations/languages.dart';
import 'package:skin_care/ui/views/splash/splash_screen.dart';
import 'package:skin_care/core/controllers/search/search_product_controller.dart';
import 'package:skin_care/firebase_options.dart';
import 'package:skin_care/core/controllers/product/product_controller.dart';

void main() async {

  Get
    ..put(AuthController())
    ..put(NavigationController())
    ..put(ProductController())
    ..put(HomeController())
    ..put(ThemeController())
    ..put(DetailController())
    ..put(CategoriesController())
    ..put(SearchProductController())
    ..put(CartController())
    ..put(CardsController())
    ..put(ReviewController())
    ..put(MessageController())
    ..put(SettingsController())
    ..put(TrackLocationController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: GetMaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        translations: Languages(),
        locale: Get.deviceLocale,
        fallbackLocale: const Locale("en", "US"),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
      ),
    );
  }
}
