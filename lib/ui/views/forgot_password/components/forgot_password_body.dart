
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/forgot_password/components/forgot_password_form.dart';
import 'package:skin_care/ui/views/forgot_password/components/forgot_password_welcome.dart';

class ForgotPasswordBody extends BaseStatelessWidget {
  const ForgotPasswordBody({
    super.key,
  });

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
            ForgotPasswordWelcome(),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}
