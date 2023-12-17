

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_title.dart';

class CartTitle extends StatelessWidget {
  int cartCount;
   CartTitle({
    required this.cartCount, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
          vertical: DeviceUtils.getDynamicHeight(context, 0.02),
        ),
        child: CustomTitle(
          titleTop: TranslationKeys.cartTitleLine1.tr,
          titleBottom: TranslationKeys.cartTitleLine2.trParams({
            "count":
                cartCount.toString(),
          }),
        ),

    );
  }
}
