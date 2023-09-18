
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/login/components/login_description.dart';
import 'package:skin_care/ui/views/login/components/login_title.dart';

class LoginWelcome extends StatelessWidget {
  const LoginWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LoginTitle(),
        LoginDescription(),
      ],
    );
  }
}
