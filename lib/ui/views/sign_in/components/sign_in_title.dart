
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';

class SignInTitle extends StatelessWidget {
  const SignInTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        TranslationKeys.signInTitle.tr,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
