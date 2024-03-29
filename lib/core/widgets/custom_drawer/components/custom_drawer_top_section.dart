

import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/widgets/custom_app_bar/custom_app_bar_back_button.dart';
import 'package:skin_care/core/widgets/custom_drawer/components/custom_drawer_title.dart';

class CustomDrawerTopSection extends BaseStatelessWidget {
  const CustomDrawerTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBarBackButton(),
          CustomDrawerTitle(),
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
