

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';
import 'package:skin_care/ui/views/checkout/checkout_screen.dart';

class CartCheckoutButton extends BaseStatelessWidget {
  const CartCheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: Obx(() {
        return CustomSubmitButton(
          title: TranslationKeys.checkout.tr,
          onTap: BaseController.cartController.cartItemList.isEmpty
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  Get.to(() => const CheckoutScreen());
                },
        );
      }),
    );
  }
}
