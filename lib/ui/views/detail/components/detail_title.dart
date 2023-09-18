
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_title.dart';

class DetailTitle extends BaseStatelessWidget {
  final String model;

  const DetailTitle({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTitle(
      titleTop: model,
      titleBottom: TranslationKeys.sneakers.tr,
    );
  }
}
