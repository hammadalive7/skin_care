
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_title.dart';

class DiscoverTitle extends StatelessWidget {
  const DiscoverTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: DeviceUtils.getDynamicHeight(context, 0.02),
      ),
      child: CustomTitle(
        titleTop: TranslationKeys.discoverTitleLine1.trParams({
          "count": "1001",
        }),
        titleBottom: TranslationKeys.discoverTitleLine2.tr,
      ),
    );
  }
}
