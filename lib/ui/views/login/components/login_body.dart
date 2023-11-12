
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/sign_in_with_google_button.dart';
import 'package:skin_care/ui/views/login/components/login_form.dart';
import 'package:skin_care/ui/views/login/components/login_sign_in_button.dart';
import 'package:skin_care/ui/views/login/components/login_welcome.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
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
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginWelcome(),
            SignInWithGoogleButton(),
            const LoginForm(),
            const Center(child: LoginSignInButton()),
          ],
        ),
      ),
    );
  }
}
