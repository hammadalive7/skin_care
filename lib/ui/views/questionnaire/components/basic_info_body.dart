import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/questionnaire/components/question_form.dart';

class BasicInfoBody extends StatelessWidget {
  const BasicInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
          vertical: 16.0,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             QuestionForm(),
          ],
        ),
      ),
    );
  }
}
