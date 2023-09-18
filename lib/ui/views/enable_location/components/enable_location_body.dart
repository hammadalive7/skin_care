
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_icon.dart';
import 'package:skin_care/ui/views/enable_location/components/enable_location_info.dart';

class EnableLocationBody extends BaseStatelessWidget {
  const EnableLocationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: DeviceUtils.getHeight(context),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EnableLocationIcon(),
            EnableLocationInfo(),
          ],
        ),
      ),
    );
  }
}
