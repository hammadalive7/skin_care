

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_material_button.dart';
import 'package:skin_care/ui/views/add_card/add_card_screen.dart';

class CardsAddCardButton extends BaseStatelessWidget {
  const CardsAddCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomMaterialButton(
        backgroundColor: BaseController.themeController.isDark.value
            ? kDarkFieldColor
            : kLightTextSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24.0),
        onTap: () => Get.to(() => const AddCardScreen()),
        child: Container(
          width: DeviceUtils.getDynamicWidth(context, 0.2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 24,
              color: BaseController.themeController.isDark.value
                  ? kDarkTextColor
                  : kLightTextPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
