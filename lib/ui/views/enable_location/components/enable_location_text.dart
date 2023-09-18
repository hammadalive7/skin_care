
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';

class EnableLocationText extends StatelessWidget {
  const EnableLocationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        TranslationKeys.enableLocationDescription.tr,
        style: context.textTheme.titleSmall?.copyWith(
          color: kLightTextSecondaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
