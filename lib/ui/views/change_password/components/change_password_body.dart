

import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/change_password/components/change_password_form.dart';
import 'package:skin_care/ui/views/change_password/components/change_password_title.dart';

class ChangePasswordBody extends BaseStatelessWidget {
  const ChangePasswordBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: DeviceUtils.getHeight(context),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChangePasswordTitle(),
            ChangePasswordForm(),
          ],
        ),
      ),
    );
  }
}
