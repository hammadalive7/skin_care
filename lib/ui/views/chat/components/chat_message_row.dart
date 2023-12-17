
import 'package:flutter/material.dart';
import 'package:skin_care/core/models/message_model.dart';
import 'package:skin_care/core/utils/device_utils.dart';
import 'package:skin_care/ui/views/chat/components/chat_message_avatar.dart';
import 'package:skin_care/ui/views/chat/components/chat_message_tile.dart';

class ChatMessageRow extends StatelessWidget {
  final Message message;

  const ChatMessageRow({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: DeviceUtils.getDynamicWidth(context, 0.07),
        vertical: DeviceUtils.getDynamicHeight(context, 0.01),
      ),
      child: Column(
        children: [
          // ChatDateText(date: message.timestamp),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ChatMessageAvatar(
                image: "assets/images/nurse.jpg",
                hasColor: false,
              ),
              ChatMessageTile(
                image: "assets/images/doctor.jpg",
                text: message.text,
                url: message.url,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
