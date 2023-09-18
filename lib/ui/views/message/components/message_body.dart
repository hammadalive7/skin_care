
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/message/components/message_chat_list.dart';
import 'package:skin_care/ui/views/message/components/message_search_text_field.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(from: 10, child: const MessageSearchTextField()),
          Expanded(child: FadeInUp(from: 10, child: const MessageChatList())),
        ],
      ),
    );
  }
}
