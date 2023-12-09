import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/sign_in_with_google_button.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_form.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_welcome.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SignInWelcome(),
            SignInWithGoogleButton(),
            const SignInForm(),
          ],
        ),
      ),
    );
  }
}
