
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_icon.dart';

class MessageSearchTextField extends StatelessWidget {
  const MessageSearchTextField({
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
        hintText: TranslationKeys.searchForMessages.tr,
        prefixIcon: "assets/images/search_normal.svg",
        prefixIconColor: BaseController.themeController.isDark.value
            ? kWhiteColor
            : kBlackColor,
      ),
    );
  }
}
