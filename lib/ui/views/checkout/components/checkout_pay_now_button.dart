
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_submit_button.dart';
import 'package:skin_care/ui/views/order_successful/order_successful_screen.dart';

import '../../../../core/controllers/cart/cart_controller.dart';
import '../../../../core/utils/base/base_controller.dart';

class CheckoutPayNowButton extends StatelessWidget {
  const CheckoutPayNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.05),
        vertical: 16.0,
      ),
      child: CustomSubmitButton(
          title: TranslationKeys.payNow.tr,
          onTap: () {
            cartController.deleteAllItemFromCart();
            HapticFeedback.heavyImpact();
            Get.offAll(() => const OrderSuccessfulScreen());
          }),
    );
  }
}
