
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';
import 'package:skin_care/ui/views/navigation/navigation_screen.dart';

class OrderSuccessfulGoHomeButton extends BaseStatelessWidget {
  const OrderSuccessfulGoHomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(
        DeviceUtils.getDynamicWidth(context, 0.05),
      ),
      child: CustomSubmitButton(
        title: TranslationKeys.goHome.tr,
        onTap: () {
          BaseController.navigationController.reset();
          BaseController.cartController.reset();
          Get.offAll(
            () => const NavigationScreen(),
          );
        },
      ),
    );
  }
}
