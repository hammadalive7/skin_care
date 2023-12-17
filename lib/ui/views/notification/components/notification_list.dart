
import 'package:flutter/material.dart';
import 'package:skin_care/core/data/product_list.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/notification/components/notification_item.dart';
import 'package:skin_care/ui/views/notification/components/notification_time_title.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
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
          const NotificationTimeTitle(title: "Today"),
          NotificationItem(
            image: productList[0].images.first,
            title: "New product added to your collection",
            description: "2 new product added",
            isNew: true,
          ),
          NotificationItem(
            image: productList[1].images.first,
            title: "Found new product with offer",
            description: "7 new product added",
            isNew: true,
          ),
          const NotificationItem(
            title: "New product added to your collection",
            description: "3 new product added",
          ),
          const NotificationTimeTitle(title: "Last Week"),
          NotificationItem(
            image: productList[2].images.first,
            title: "Delivered successfully. Hope you are glad!",
            description: "10 mins ago",
          ),
          const NotificationItem(
            title: "Your order have been confirmed. Keep shopping!",
            description: "12/31/22",
          ),
        ],
      ),
    );
  }
}
