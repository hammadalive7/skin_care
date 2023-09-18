
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/profile/components/profile_info_text.dart';

class ProfileNameText extends BaseStatelessWidget {
  const ProfileNameText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileInfoText(
      title: TranslationKeys.nameTitle.tr,
      text: "NOTHING",
    );
  }
}
