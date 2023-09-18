
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';

class OnboardingImage extends BaseStatelessWidget {
  const OnboardingImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(DeviceUtils.getDynamicWidth(context, 0.07), 0),
      child: Image.asset(
        "assets/images/product.jpg",
        width: DeviceUtils.getWidth(context),
      ),
    );
  }
}
