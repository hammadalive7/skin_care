
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';

class OrderSuccessfulTitle extends BaseStatelessWidget {
  const OrderSuccessfulTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      TranslationKeys.congratulations.tr,
      style: context.textTheme.headlineSmall,
    );
  }
}
