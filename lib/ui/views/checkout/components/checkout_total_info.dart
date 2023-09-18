
import 'package:flutter/material.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_divider.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_shipping_cost.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_subtotal.dart';
import 'package:skin_care/ui/views/checkout/components/checkout_total.dart';

class CheckoutTotalInfo extends StatelessWidget {
  const CheckoutTotalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CheckoutSubtotal(),
        CheckoutShippingCost(),
        CheckoutDivider(),
        CheckoutTotal(),
      ],
    );
  }
}
