
import 'package:flutter/material.dart';

import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_delivery_address_card.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_delivery_address_title.dart';

class CheckoutDeliveryAddress extends StatelessWidget {
  const CheckoutDeliveryAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: 16.0,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckoutDeliveryAddressTitle(),
          CheckoutDeliveryAddressCard(),
        ],
      ),
    );
  }
}
