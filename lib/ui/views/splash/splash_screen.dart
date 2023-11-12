
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/ui/views/onboarding/onboarding_screen.dart';
import 'package:skin_care/ui/views/splash/components/splash_body.dart';

import '../navigation/navigation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      checkUserAuthenticationStatus();
    });
  }

  Future<void> checkUserAuthenticationStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.offAll(() => const NavigationScreen());
    } else {
      Get.offAll(() => const OnboardingScreen());
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kLightBlueColor,
      body: SplashBody(),
    );
  }
}
