

import 'package:flutter/material.dart';

import 'package:skin_care/core/models/order_model.dart';
import 'package:skin_care/ui/views/track_order/components/track_order_info.dart';
import 'package:skin_care/ui/views/track_order/components/track_order_location_info.dart';
import 'package:skin_care/ui/views/track_order/components/track_order_title.dart';

class TrackOrderBody extends StatelessWidget {
  final Order order;

  const TrackOrderBody({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TrackOrderTitle(),
          TrackOrderInfo(order: order),
          TrackOrderLocationInfo(order: order),
        ],
      ),
    );
  }
}
