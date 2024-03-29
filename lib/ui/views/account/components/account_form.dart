

import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/account/components/account_email_field.dart';
import 'package:skin_care/ui/views/account/components/account_name_field.dart';
import 'package:skin_care/ui/views/account/components/account_phone_number_field.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({
    super.key,
  });

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends BaseState<AccountForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: DeviceUtils.getDynamicHeight(context, 0.15),
      ),
      child: Form(
        key: BaseController.settingsController.changeAccountInfoFormKey,
        child: const Column(
          children: [
            AccountNameField(),
            AccountEmailField(),
            AccountPhoneNumberField(),
          ],
        ),
      ),
    );
  }
}
