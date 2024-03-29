
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:skin_care/core/data/order_list.dart';
import 'package:skin_care/core/translations/translation_keys.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/order_summary/components/order_summary_history_title.dart';
import 'package:skin_care/ui/views/order_summary/components/order_summary_order_item.dart';

class OrderSummaryOrderList extends StatelessWidget {
  const OrderSummaryOrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: ListView(
        children: [
          OrderSummaryHistoryTitle(title: TranslationKeys.recentOrder.tr),
          OrderSummaryOrderItem(order: orderList[0]),
          const OrderSummaryHistoryTitle(title: "Last Month History"),
          OrderSummaryOrderItem(order: orderList[1]),
          OrderSummaryOrderItem(order: orderList[2]),
          OrderSummaryOrderItem(order: orderList[3]),
          OrderSummaryOrderItem(order: orderList[4]),
        ],
      ),
    );
  }
}
