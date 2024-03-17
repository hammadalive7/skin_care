
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class SignInUsernameField extends StatelessWidget {
  final TextEditingController? controller;
  const SignInUsernameField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DeviceUtils.getDynamicWidth(context, 0.02),
      ),
      child: CustomTextFieldWithTitle(
        controller: controller,
        title: TranslationKeys.usernameTitle.tr,
        hintText: TranslationKeys.usernameHint.tr,
        textInputAction: TextInputAction.next,
        //email validation

      ),
    );
  }
}
