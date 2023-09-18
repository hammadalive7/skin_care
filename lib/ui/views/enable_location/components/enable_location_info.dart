
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_text.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_title.dart';

class EnableLocationInfo extends BaseStatelessWidget {
  const EnableLocationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 4.0,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EnableLocationTitle(),
          EnableLocationText(),
        ],
      ),
    );
  }
}
