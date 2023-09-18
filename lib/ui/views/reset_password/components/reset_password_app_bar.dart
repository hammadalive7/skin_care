// ignore_for_file: avoid_field_initializers_in_const_classes


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';

class ResetPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ResetPasswordAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: TranslationKeys.forgotPassword.tr.toUpperCase());
  }
}
