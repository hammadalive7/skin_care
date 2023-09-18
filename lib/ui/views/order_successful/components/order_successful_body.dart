
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/order_successful/components/order_successful_icon.dart';
import 'package:skin_care/ui/views/order_successful/components/order_successful_info.dart';

class OrderSuccessfulBody extends BaseStatelessWidget {
  const OrderSuccessfulBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OrderSuccessfulIcon(),
          OrderSuccessfulInfo(),
        ],
      ),
    );
  }
}
