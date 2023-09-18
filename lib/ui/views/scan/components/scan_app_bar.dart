// ignore_for_file: avoid_field_initializers_in_const_classes


import 'package:flutter/material.dart';

import 'package:skin_care/core/constants/color_constants.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';

class ScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ScanAppBar({
    super.key,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      title: "SCAN",
      titleColor: kWhiteColor,
      leading: CustomAppBarBackButton(isTransparent: false),
      isTransparent: true,
    );
  }
}
