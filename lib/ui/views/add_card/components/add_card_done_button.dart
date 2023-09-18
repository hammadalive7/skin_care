
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';

class AddCardDoneButton extends BaseStatelessWidget {
  final VoidCallback onTap;

  const AddCardDoneButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomSubmitButton(
        title: TranslationKeys.done.tr,
        onTap: onTap,
      ),
    );
  }
}
