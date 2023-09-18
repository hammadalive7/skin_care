
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';

class LoginRememberMeCheckbox extends StatefulWidget {
  const LoginRememberMeCheckbox({
    super.key,
  });

  @override
  State<LoginRememberMeCheckbox> createState() =>
      _LoginRememberMeCheckboxState();
}

class _LoginRememberMeCheckboxState extends BaseState<LoginRememberMeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Transform.translate(
          offset: const Offset(-16, 0),
          child: Theme(
            data: context.theme.copyWith(
                checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)))),
            child: CheckboxListTile(
              title: Text(
                TranslationKeys.rememberMe.tr,
                style: context.textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: BaseController.authController.loginRememberMe.value,
              activeColor: kLightBlueColor,
              onChanged: (val) =>
                  BaseController.authController.setLoginRememberMe(val!),
            ),
          ),
        );
      },
    );
  }
}
