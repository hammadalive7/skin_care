

import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/change_address/components/change_address_new_address_field.dart';
import 'package:skin_care/ui/views/change_address/components/change_address_old_address_field.dart';

class ChangeAddressForm extends StatefulWidget {
  const ChangeAddressForm({
    super.key,
  });

  @override
  State<ChangeAddressForm> createState() => _ChangeAddressFormState();
}

class _ChangeAddressFormState extends State<ChangeAddressForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: Form(
        key: BaseController.settingsController.changeAddressFormKey,
        child: const Column(
          children: [
            ChangeAddressOldAddressField(),
            ChangeAddressNewAddressField(),
          ],
        ),
      ),
    );
  }
}
