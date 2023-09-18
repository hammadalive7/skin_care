
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/reset_password/components/reset_password_description.dart';
import 'package:skin_care/ui/views/reset_password/components/reset_password_title.dart';

class ResetPasswordWelcome extends StatelessWidget {
  const ResetPasswordWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResetPasswordTitle(),
        ResetPasswordDescription(),
      ],
    );
  }
}
