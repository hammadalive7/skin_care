

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class AccountPhoneNumberField extends StatelessWidget {
  const AccountPhoneNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.phoneNumberTitle.tr,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(12),
        ],

        hintText: TranslationKeys.phoneNumberHint.tr,
      ),
    );
  }
}
