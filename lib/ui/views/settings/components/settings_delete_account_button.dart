
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_warning_alert/custom_warning_alert.dart';
import 'package:skin_care/ui/views/login/login_screen.dart';

class SettingsDeleteAccountButton extends StatelessWidget {
  const SettingsDeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          TextButton(
            onPressed: () =>
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      CustomWarningAlert(
                        title: TranslationKeys.deleteAccountWarning.tr,
                        yesTitle: TranslationKeys.delete.tr,
                        onYesPressed: () {
                          Get.offAll(() => const LoginScreen());
                        },
                      ),
                ),
            child: Text(
              TranslationKeys.deleteAccount.tr,
              style: context.textTheme.bodyLarge?.copyWith(
                color: kRedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
