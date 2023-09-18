
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';

class TrackLocationAppBar extends BaseStatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TrackLocationAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: TranslationKeys.trackLocation.tr,
      titleColor: kLightTextPrimaryColor,
      leading: const CustomAppBarBackButton(isTransparent: false),
      isTransparent: true,
    );
  }
}
