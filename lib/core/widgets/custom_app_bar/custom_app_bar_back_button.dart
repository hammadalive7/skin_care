

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_button.dart';

class CustomAppBarBackButton extends BaseStatelessWidget {
  final bool isTransparent;

  const CustomAppBarBackButton({
    Key? key,
    this.isTransparent = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBarButton(
      icon: "assets/images/arrow_back.svg",
      iconSize: 16.0,
      onPressed: () => Get.back(),
      isTransparent: isTransparent,
    );
  }
}
