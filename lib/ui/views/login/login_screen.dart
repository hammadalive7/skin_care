
import 'package:flutter/material.dart';
import 'package:skin_care/ui/views/login/components/login_app_bar.dart';
import 'package:skin_care/ui/views/login/components/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LoginAppBar(),
      body: LoginBody(),
    );
  }
}
