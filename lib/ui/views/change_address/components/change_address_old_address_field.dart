

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_multiline_text_field_with_title.dart';

class ChangeAddressOldAddressField extends StatelessWidget {
  const ChangeAddressOldAddressField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomMultilineTextFieldWithTitle(
        title: TranslationKeys.oldAddressTitle.tr,
        hintText: TranslationKeys.oldAddressHint.tr,
        maxLines: 2,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
