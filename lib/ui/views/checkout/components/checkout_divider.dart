
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/core/widgets/custom_dashed_horizontal_line.dart';

class CheckoutDivider extends StatelessWidget {
  const CheckoutDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getWidth(context),
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 24.0,
      ),
      child: const CustomDashedHorizontalLine(),
    );
  }
}
