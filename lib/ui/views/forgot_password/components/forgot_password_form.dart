
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/ui/views/reset_password/reset_password_screen.dart';
import 'package:skin_care/ui/views/forgot_password/components/forgot_password_email_field.dart';
import 'package:skin_care/ui/views/forgot_password/components/forgot_password_send_email_button.dart';

import '../../../../core/controllers/auth/auth_controller.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ForgotPasswordEmailField(mailController: controller.emailController,),
          ForgotPasswordSendEmailButton(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                bool result = await controller.forgotPassword(email: controller.emailController.text);
                if (result) {
                  Get.snackbar(
                    "Success",
                    "An email has been sent to your email address",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
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
