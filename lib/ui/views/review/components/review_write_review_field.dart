
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_text_field/custom_multiline_text_field.dart';

class ReviewWriteReviewField extends BaseStatelessWidget {
  const ReviewWriteReviewField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMultilineTextField(
      hintText: TranslationKeys.writeReviewHint.tr,
      maxLines: 5,
    );
  }
}
