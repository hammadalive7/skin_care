
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class CheckoutSubtotal extends StatelessWidget {
  const CheckoutSubtotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TranslationKeys.subtotal.tr,
            style: context.textTheme.labelMedium?.copyWith(
              color: kLightTextSecondaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          Obx(
                () =>
                Text(
                  "\$ ${BaseController.cartController.getCartTotal.toStringAsFixed(
                      2)}",
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
