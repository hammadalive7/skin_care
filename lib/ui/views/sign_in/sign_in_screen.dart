
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/sign_in/components/sign_in_app_bar.dart';
import 'package:skin_care/ui/views/sign_in/components/sign_in_body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SignInAppBar(),
      body: SignInBody(),
    );
  }
}
