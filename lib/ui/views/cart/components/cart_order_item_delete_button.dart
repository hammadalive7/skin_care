

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/models/cart_item_model.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_warning_alert/custom_warning_alert.dart';

class CartOrderItemDeleteButton extends StatelessWidget {
  final int index;
  CartItem cartItem;

   CartOrderItemDeleteButton({
    required this.index,
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getDynamicHeight(context, 0.07),
      child: FloatingActionButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
          showDialog(
            context: context,
            builder: (BuildContext context) => CustomWarningAlert(
              title: TranslationKeys.removeItemWarning.tr,
              onYesPressed: () {
                BaseController.cartController.deleteItemFromCart(cartItem);
                Get.back();
              },
            ),
          );
        },
        backgroundColor: kRedColor,
        child: SvgPicture.asset(
          "assets/images/trash.svg",
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
