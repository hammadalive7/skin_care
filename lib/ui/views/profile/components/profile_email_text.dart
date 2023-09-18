
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/profile/components/profile_info_text.dart';

class ProfileEmailText extends BaseStatelessWidget {
  const ProfileEmailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ProfileInfoText(
        title: TranslationKeys.emailTitle.tr,
        text: "nothing@gmail.com",
      ),
    );
  }
}
