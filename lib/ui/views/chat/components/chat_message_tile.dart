
import 'package:flutter/material.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:get/get_utils/get_utils.dart';

class ChatMessageTile extends StatelessWidget {
  final String image;
  final String text;
  final String url;

  const ChatMessageTile({
    required this.text,
    super.key,
    this.image = "",
    this.url = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: BaseController.themeController.isDark.value
            ? kDarkFieldColor
            : kLightFieldColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      width: DeviceUtils.getDynamicWidth(context, 0.5),
      child: Column(
        children: [
          if (image.isNotEmpty) Image.asset("assets/images/doctor.jpg"),
          Text(
            "Hello, how can I help you?",
            style: context.textTheme.bodyMedium,
          ),
          if (url.isNotEmpty)
            Text(
              "https://www.skincare.com",
              style: context.textTheme.bodyMedium?.copyWith(
                color: kBlueColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
              ),
            ),
        ],
      ),
    );
  }
}
