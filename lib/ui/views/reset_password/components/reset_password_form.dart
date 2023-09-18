
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/ui/views/login/login_screen.dart';
import 'package:skin_care/ui/views/reset_password/components/reset_password_confirm_password_field.dart';
import 'package:skin_care/ui/views/reset_password/components/reset_password_done_button.dart';
import 'package:skin_care/ui/views/reset_password/components/reset_password_password_field.dart';

class ResetPasswordForm extends StatelessWidget {
  ResetPasswordForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const ResetPasswordPasswordField(),
          const ResetPasswordConfirmPasswordField(),
          ResetPasswordDoneButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (BaseController.authController.validateResetPassword()) {
                  BaseController.authController.reset();
                  Get.off(() => const LoginScreen());
                } else {
                  Get.showSnackbar(
                    GetSnackBar(
                      message: TranslationKeys.passwordsDontMatch.tr,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
