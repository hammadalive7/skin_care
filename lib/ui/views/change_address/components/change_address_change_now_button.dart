

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';

class ChangeAddressChangeNowButton extends StatelessWidget {
  const ChangeAddressChangeNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: CustomSubmitButton(
        title: TranslationKeys.changeNow.tr,
        onTap: () {
          if (BaseController
              .settingsController.changeAddressFormKey.currentState!
              .validate()) {
            Get
              ..back()
              ..showSnackbar(
                GetSnackBar(
                  message: TranslationKeys.changesSavedSuccessfully.tr,
                  duration: const Duration(seconds: 3),
                ),
              );
          }
        },
      ),
    );
  }
}
