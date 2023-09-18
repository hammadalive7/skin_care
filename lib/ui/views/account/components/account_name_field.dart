

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class AccountNameField extends StatelessWidget {
  const AccountNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.nameTitle.tr,
        hintText: TranslationKeys.nameHint.tr,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
