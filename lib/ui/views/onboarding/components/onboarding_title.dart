
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/ui/views/onboarding/components/onboarding_bordered_title_text.dart';
import 'package:skin_care/ui/views/onboarding/components/onboarding_title_text.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnboardingBorderedTitleText(
          text: TranslationKeys.onboardingTitleLine1.tr,
        ),
        OnboardingTitleText(
          text: TranslationKeys.onboardingTitleLine2.tr,
        ),
        OnboardingBorderedTitleText(
          text: TranslationKeys.onboardingTitleLine3.tr,
        ),
        OnboardingTitleText(
          text: "Products".tr,
        ),
      ],
    );
  }
}
