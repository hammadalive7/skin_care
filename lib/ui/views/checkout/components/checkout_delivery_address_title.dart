
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/translations/translation_keys.dart';

class CheckoutDeliveryAddressTitle extends StatelessWidget {
  const CheckoutDeliveryAddressTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        TranslationKeys.deliveryAddress.tr,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
