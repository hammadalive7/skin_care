
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class ForgotPasswordEmailField extends BaseStatelessWidget {
  TextEditingController mailController;
  ForgotPasswordEmailField({
    super.key,
    required this.mailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DeviceUtils.getDynamicWidth(context, 0.02),
      ),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.emailTitle.tr,
        hintText: TranslationKeys.emailHint.tr,
        controller: mailController,
      ),
    );
  }
}
