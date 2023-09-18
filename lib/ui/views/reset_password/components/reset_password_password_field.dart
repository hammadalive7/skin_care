
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class ResetPasswordPasswordField extends StatelessWidget {
  const ResetPasswordPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DeviceUtils.getDynamicWidth(context, 0.02),
      ),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.passwordTitle.tr,
        hintText: TranslationKeys.passwordHint.tr,
        obscureText: true,
        textInputAction: TextInputAction.next,
        onChanged: (val) => BaseController.authController.changePassword(val),
      ),
    );
  }
}
