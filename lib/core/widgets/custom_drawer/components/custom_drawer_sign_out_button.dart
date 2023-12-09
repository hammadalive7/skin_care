import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/login/login_screen.dart';

class CustomDrawerSignOutButton extends BaseStatelessWidget {
  const CustomDrawerSignOutButton({Key? key}) : super(key: key);

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    prefs
      ..setBool('isLoggedIn', false)
      ..remove('userId');
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: TextButton(
        onPressed: () {
          signOut();
          BaseController.homeController.reset();
          BaseController.navigationController.reset();
        },
        child: Row(
          children: [
            SvgPicture.asset("assets/images/sign_out_arrow.svg"),
            const SizedBox(width: 16.0),
            Text(
              TranslationKeys.signOut.tr,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
