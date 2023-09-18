
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class DetailInteractiveProductImage extends StatefulWidget {
  const DetailInteractiveProductImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  State<DetailInteractiveProductImage> createState() =>
      _DetailInteractiveProductImageState();
}

class _DetailInteractiveProductImageState
    extends BaseState<DetailInteractiveProductImage> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      contentPadding: EdgeInsets.zero,
      content: Wrap(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.close,
                color: BaseController.themeController.isDark.value
                    ? kDarkTextColor
                    : kLightTextPrimaryColor,
              ),
            ),
          ),
          InteractiveViewer(
            minScale: 0.1,
            maxScale: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.asset(
                widget.image,
                width: DeviceUtils.getWidth(context),
                height: DeviceUtils.getDynamicHeight(context, 0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
