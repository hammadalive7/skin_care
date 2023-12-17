
import 'package:flutter/material.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class CartOrderItemImage extends StatelessWidget {
  final String image;

  const CartOrderItemImage({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getWidth(context),
      height: DeviceUtils.getDynamicHeight(context, 0.15),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: BaseController.themeController.isDark.value
            ? kDarkFieldColor
            : kLightFieldColor,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Image.network(image),
    );
  }
}
