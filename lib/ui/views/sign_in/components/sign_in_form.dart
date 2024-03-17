import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/controllers/auth/auth_controller.dart';

import 'package:skin_care/ui/views/navigation/navigation_screen.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_email_field.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_password_field.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_sign_in_button.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_username_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SignInUsernameField(controller: controller.usernameController),
          SignInEmailField(controller: controller.emailController),
          SignInPasswordField(controller: controller.passwordController),
          SignInSignInButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                final email = controller.emailController.text;
                final username = controller.usernameController.text;
                final password = controller.passwordController.text;
                controller.signUp(email, password, username);
              }
            },
          ),
        ],
      ),
    );
  }
}
