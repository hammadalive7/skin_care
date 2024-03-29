

import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/change_password/components/change_password_app_bar.dart';
import 'package:skin_care/ui/views/change_password/components/change_password_body.dart';
import 'package:skin_care/ui/views/change_password/components/change_password_change_now_button.dart';

class ChangePasswordScreen extends BaseStatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ChangePasswordAppBar(),
      body: ChangePasswordBody(),
      floatingActionButton: ChangePasswordChangeNowButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
