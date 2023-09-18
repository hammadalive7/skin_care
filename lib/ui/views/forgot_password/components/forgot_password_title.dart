
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';

class ForgotPasswordTitle extends BaseStatelessWidget {
  const ForgotPasswordTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        TranslationKeys.forgotPasswordTitle.tr,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
