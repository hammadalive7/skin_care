
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_title.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: DeviceUtils.getDynamicHeight(context, 0.01),
      ),
      child: Text(
        "SkinCloud",
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 35,
        ),),
      // CustomTitle(
      //   titleTop: TranslationKeys.homeTitleLine1.trParams({
      //     "product": "Skin",
      //   }),
      //   titleBottom: TranslationKeys.products.tr,
      // ),
    );
  }
}
