
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/ui/views/login/components/login_email_field.dart';
import 'package:skin_care/ui/views/login/components/login_login_button.dart';
import 'package:skin_care/ui/views/login/components/login_password_field.dart';
import 'package:skin_care/ui/views/login/components/login_remember_me_checkbox.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: BaseController.authController.formKey,
      child: Column(
        children: [
          const LoginEmailField(),
          const LoginPasswordField(),
          const LoginRememberMeCheckbox(),
          LoginLoginButton(
            onTap: () {
              if (BaseController.authController.formKey.currentState!
                  .validate()) {
                HapticFeedback.lightImpact();
                Get.offAll(
                  () => const NavigationScreen(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
