
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_cart_button.dart';

class TrackOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TrackOrderAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: TranslationKeys.trackOrder.tr.toUpperCase(),
      leading: const CustomAppBarBackButton(),
      trailing: const CustomAppBarCartButton(),
    );
  }
}
