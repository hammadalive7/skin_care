
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class ResetPasswordConfirmPasswordField extends StatefulWidget {
  const ResetPasswordConfirmPasswordField({
    super.key,
  });

  @override
  State<ResetPasswordConfirmPasswordField> createState() =>
      _ResetPasswordConfirmPasswordFieldState();
}

class _ResetPasswordConfirmPasswordFieldState
    extends BaseState<ResetPasswordConfirmPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DeviceUtils.getDynamicWidth(context, 0.02),
      ),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.confirmNewPasswordTitle.tr,
        hintText: TranslationKeys.confirmNewPasswordHint.tr,
        obscureText: true,
        onChanged: (val) =>
            BaseController.authController.changeConfirmPassword(val),
      ),
    );
  }
}
