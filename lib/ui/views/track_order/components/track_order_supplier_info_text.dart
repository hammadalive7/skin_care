
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class TrackOrderSupplierInfoText extends StatelessWidget {
  final String description;

  const TrackOrderSupplierInfoText({
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TranslationKeys.from.tr,
            style: context.textTheme.bodyLarge?.copyWith(
              color: kLightTextSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            description,
            style: context.textTheme.labelLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
