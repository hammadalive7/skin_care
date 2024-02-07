import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/controllers/auth/auth_controller.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';
import 'package:skin_care/ui/views/login/components/login_email_field.dart';
import 'package:skin_care/ui/views/login/components/login_login_button.dart';
import 'package:skin_care/ui/views/login/components/login_password_field.dart';
import 'package:skin_care/ui/views/login/components/login_remember_me_checkbox.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

class QuestionForm extends StatefulWidget {
  const QuestionForm({
    super.key,
  });

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Gender",
              hintText: "Male/Female",
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Gender",
              hintText: "e.g: Male/Female",
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Age",
              hintText: "e.g: 22",
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Ethnicity",
              hintText: "e.g: Asian",
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Region",
              hintText: "e.g: Asia",
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: DeviceUtils.getDynamicWidth(context, 0.02),
            ),
            child: const CustomTextFieldWithTitle(
              title: "Country",
              hintText: "e.g: Pakistan",
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
}
