
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/ui/views/onboarding/onboarding_screen.dart';
import 'package:skin_care/ui/views/splash/components/splash_body.dart';

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
      Get.offAll(() => const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kLightBlueColor,
      body: SplashBody(),
    );
  }
}
