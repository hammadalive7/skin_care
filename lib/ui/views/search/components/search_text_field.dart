
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_icon.dart';
import 'package:skin_care/ui/views/search/components/search_filter_bottom_sheet.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: DeviceUtils.getDynamicHeight(context, 0.02),
      ),
      child: CustomTextFieldWithIcon(
        controller:
            BaseController.searchProductController.searchFieldController.value,
        hintText: TranslationKeys.searchForProduct.tr,
        prefixIcon: "assets/images/search_normal.svg",
        suffixIcon: "assets/images/filter.svg",
        prefixIconColor: BaseController.themeController.isDark.value
            ? kWhiteColor
            : kBlackColor,
        suffixIconColor: kRedColor,
        suffixIconOnTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const SearchFilterBottomSheet(),
        ),
      ),
    );
  }
}
