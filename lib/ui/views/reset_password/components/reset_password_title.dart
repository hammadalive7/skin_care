
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';

class ResetPasswordTitle extends StatelessWidget {
  const ResetPasswordTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        TranslationKeys.resetPasswordTitle.tr,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
