
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_bottom_sheet/custom_bottom_sheet_subtitle.dart';
import 'package:skin_care/core/widgets/custom_price_range_slider.dart';

class HomeFilterPriceRange extends BaseStatelessWidget {
  const HomeFilterPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBottomSheetSubtitle(title: TranslationKeys.priceRange.tr),
          const CustomPriceRangeSlider(
            rangeStartValue: 14.0,
            rangeEndValue: 400.0,
            currentStartValue: 125.0,
            currentEndValue: 378.0,
          ),
        ],
      ),
    );
  }
}
