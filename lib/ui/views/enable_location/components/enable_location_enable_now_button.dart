
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';

class EnableLocationEnableNowButton extends BaseStatelessWidget {
  const EnableLocationEnableNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
      ),
      child: CustomSubmitButton(
        title: TranslationKeys.enableNow.tr,
        onTap: () =>
            BaseController.trackLocationController.requestLocationPermission(),
      ),
    );
  }
}
