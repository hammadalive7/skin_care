
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/order_model.dart';
import 'package:skin_care/core/utils/base/base_stateless.dart';
import 'package:skin_care/ui/views/track_order/components/track_order_supplier_info_text.dart';

class TrackOrderSupplierInfo extends BaseStatelessWidget {
  final Order order;

  const TrackOrderSupplierInfo({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TrackOrderSupplierInfoText(description: order.supplier.name),
        TrackOrderSupplierInfoText(
          description: order.supplier.location.address,
        ),
      ],
    );
  }
}
