
import 'package:flutter/material.dart';

import 'package:skin_care/core/data/order_supplier_list.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/message/components/message_chat_item.dart';
import 'package:skin_care/ui/views/message/components/message_chat_list_title.dart';

class MessageChatList extends StatelessWidget {
  const MessageChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MessageChatListTitle(),
          Expanded(
            child: ListView(
              children: [
                MessageChatItem(
                  sender: orderSupplierList[0],
                  senderIconHasColor: false,
                  lastMessage: "Nope!",
                  newMessageCount: 2,
                ),
                MessageChatItem(
                  sender: orderSupplierList[1],
                  senderIconHasColor: false,
                  lastMessage: "Thanks you.",
                  newMessageCount: 0,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
