
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/controllers/auth/auth_controller.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/ui/views/login/components/login_email_field.dart';
import 'package:skin_care/ui/views/login/components/login_login_button.dart';
import 'package:skin_care/ui/views/login/components/login_password_field.dart';
import 'package:skin_care/ui/views/login/components/login_remember_me_checkbox.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

import '../../forgot_password/forgot_password_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BaseController.authController.formKey,
      child: Column(
        children: [
          LoginEmailField(controller: controller.loginEmailController),
          LoginPasswordField(controller: controller.loginPasswordController),
          // const LoginRememberMeCheckbox(),
          //forgot password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LoginLoginButton(
            onTap: () {
              if (BaseController.authController.formKey.currentState!
                  .validate()) {
                HapticFeedback.lightImpact();
                controller.logIn(controller.loginEmailController.text,
                  controller.loginPasswordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
