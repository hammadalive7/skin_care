
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class CheckoutTotal extends StatelessWidget {
  const CheckoutTotal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: DeviceUtils.getDynamicWidth(context, 0.07),
        right: DeviceUtils.getDynamicWidth(context, 0.07),
        bottom: DeviceUtils.getDynamicHeight(context, 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TranslationKeys.total.tr,
            style: context.textTheme.labelMedium?.copyWith(
              color: kLightTextSecondaryColor,
            ),
          ),
          Obx(
                () =>
                Text(
                  "\$ ${BaseController.cartController.cartTotalWithShippingCost
                      .toStringAsFixed(2)}",
                  style: context.textTheme.titleMedium,
                ),
          ),
        ],
      ),
    );
  }
}
