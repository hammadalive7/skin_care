// ignore_for_file: avoid_field_initializers_in_const_classes



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';

class AddCardAppBar extends BaseStatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const AddCardAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: TranslationKeys.addCard.tr.toUpperCase(),
      leading: const CustomAppBarBackButton(),
    );
  }
}
