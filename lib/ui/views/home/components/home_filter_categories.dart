
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_bottom_sheet/custom_bottom_sheet_subtitle.dart';
import 'package:skin_care/ui/views/home/components/home_filter_categories_list.dart';

class HomeFilterCategories extends StatelessWidget {
  const HomeFilterCategories({
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
            vertical: 4.0,
          ),
          child:
              CustomBottomSheetSubtitle(title: TranslationKeys.categories.tr),
        ),
        const HomeFilterCategoriesList(),
      ],
    );
  }
}
