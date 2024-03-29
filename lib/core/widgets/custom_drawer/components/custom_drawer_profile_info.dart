

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/account/account_screen.dart';

class CustomDrawerProfileInfo extends BaseStatelessWidget {
  const CustomDrawerProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const AccountScreen()),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Image.asset("assets/images/profile_picture.png", width: 64.0),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Skin Care",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  TranslationKeys.editProfile.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kLightTextSecondaryColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
