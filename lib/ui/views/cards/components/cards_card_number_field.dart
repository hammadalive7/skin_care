
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_controller.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_text_field_with_title.dart';

class CardsCardNumberField extends BaseStatelessWidget {
  const CardsCardNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: DeviceUtils.getDynamicWidth(context, 0.02),
      ),
      child: CustomTextFieldWithTitle(
        title: TranslationKeys.cardNumberTitle.tr,
        hintText: TranslationKeys.cardNumberHint.tr,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onChanged: (val) {
          BaseController.cardsController.changeCardNumber(val);
        },
        inputFormatters: [
          BaseController.cardsController.cardNumberFormatter,
          LengthLimitingTextInputFormatter(19),
        ],
      ),
    );
  }
}
