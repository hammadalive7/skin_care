
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_bottom_sheet/custom_bottom_sheet_subtitle.dart';
import 'package:skin_care/ui/views/search/components/search_filter_select_size_list.dart';

class SearchFilterSelectSize extends StatelessWidget {
  const SearchFilterSelectSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
            vertical: 8.0,
          ),
          child:
              CustomBottomSheetSubtitle(title: TranslationKeys.selectSize.tr),
        ),
        const SearchFilterSelectSizeList(),
      ],
    );
  }
}
